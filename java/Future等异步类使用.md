Future
====

作用: 代表一个异步的计算的结果，用于执行一些等待时间较长的代码,通过get()方法,阻塞获取结果。

用法:

	<!---->
	ExecutorService executorService = Executors.newFixedThreadPool(1);//创建一个线程池
	Future<String> future = executorService.submit(new Callable<String>() {
		
		@Override
		public String call() {
			//excute long time action
			return "hello world";
		}
	});//返回一个future
	//这里可以去做其他的事情
	String result = future.get();//阻塞获取结果
	

FutureTask
===

作用: FutureTask是Future的实现类, 实现了Runnable和Future兼顾两者的优点

	ExecutorService executorService = Executors.newFixedThreadPool(1);
	FutureTask<String> task = new FutureTask<>(() -> "呵呵呵");
	executorService.execute(task);
	System.out.println(task.isDone());
	System.out.println(task.get());
	System.out.println(task.isDone());
	executorService.shutdown();


