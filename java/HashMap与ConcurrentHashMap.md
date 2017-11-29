HashMap与ConcurrentHashMap
====

HashMap: 

	根据键的hashCode值存储数据，查找的时间复杂度是O(1)，无序，键可为null,值可为null，线程不安全，多线程put操作会导致死循环。HashMap的结构是由数组加链表构成。
	

	int threshold;//所能容纳的key-value对极限 = length * loadFactor
	final float loadFactor; //负载因子
	int modCount;//内部结构发生变化的次数
	int size; //实际HashMap中存放的元素大小
	int length = 16;//默认是16，大小必须是2的n次方
	
	
CAS算法:

	unsafe.compareAndSwapInt(this, valueOffset, expect, update); CAS(Compare And Swap): 
	如果valueOffset位置包含的值与expect值相同则更新valueOffset位置的值为update,并且返回true,否则不更新，返回false。
	
ConcurrentHashMap:

		sizeCtl是一个用于同步多个线程的共享变量，如果它的当前值为负数，则说明table正在被某个线程初始化或者扩容。
	所以，如果某个线程想要初始化table或者对table扩容，需要去竞争sizeCtl这个共享变量，
	获得变量的线程才有许可去进行接下来的操作，没能获得的线程将会一直自旋来尝试获得这个共享变量，
	所以获得sizeCtl这个变量的线程在完成工作之后需要设置回来，使得其他的线程可以走出自旋进行接下来的操作。
	而在initTable方法中我们可以看到，当线程发现sizeCtl小于0的时候，他就会让出CPU时间，而稍后再进行尝试。
	当发现sizeCtl不再小于0的时候，就会通过调用方法compareAndSwapInt来讲sizeCtl共享变量变为-1，
	以告诉其他试图获得sizeCtl变量的线程，目前正在由本线程在享用该变量，在我完成我的任务之前你可以先休息一会，
	等会再来试试吧，我完成工作之后会释放掉的。而其他的线程在发现sizeCtl小于0的时候就会理解这种交流，
	他们会让出cpu时间，等待下次调度再来尝试获取sizeCtl来进行自己的工作。
	在完成初始化table的任务之后，线程需要将sizeCtl设置成可以使得其他线程获得变量的状态，这其中还有一个地方需要注意，
	就是在某个线程通过U.compareAndSwapInt方法设置了sizeCtl之前和之后进行了两次check，来检测table是否被初始化过了，
	这种检测是必须的，因为在并发环境下，可能前一个线程正在初始化table但是还没有成功初始化，也就是table依然还为null，
	而有一个线程发现table为null他就会进行竞争sizeCtl以进行table初始化，但是当前线程在完成初始化之后，那个试图初始化table的线程获得了sizeCtl，但是此时table已经被初始化了。
	所以，如果没有再次判断的话，可能会将之后进行put操作的线程的更新覆盖掉，这是极为不安全的行为。


