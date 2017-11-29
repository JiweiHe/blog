Quartz tutoial
============

####Scheduler 是quartz中主要的一个接口, 可使用SchdulerFactory来实例化一个Schduler.
	SchedulerFactory schedFact = new org.quartz.impl.StdSchedulerFactory();

  	Scheduler sched = schedFact.getScheduler();

  	sched.start();

  	// HelloJob 就是你定时触发的任务
  	JobDetail job = newJob(HelloJob.class)
      .withIdentity("myJob", "group1")//1.job 名, 2. jobgroup 名
      .build();

  	// 定义一个trigger 现在触发，并每隔40秒触发
  	Trigger trigger = newTrigger()
      .withIdentity("myTrigger", "group1")//trigger 名， trigger group名
      .startNow()
      .withSchedule(simpleSchedule()
          .withIntervalInSeconds(40)
          .repeatForever())
      .build();

  	// Tell quartz to schedule the job using our trigger
  	sched.scheduleJob(job, trigger);