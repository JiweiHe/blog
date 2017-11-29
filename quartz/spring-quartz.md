Spring-Quartz
======

整合spring 的一个主要的点就在于实例化一个SchedulerFactoryBean。

    @Bean
    public SchedulerFactoryBean schedulerFactoryBean(DataSource dataSource, TaskExecutor taskExecutor, JobDetail... jobDetails) throws SchedulerException {
        SchedulerFactoryBean quartzScheduler = new SchedulerFactoryBean();
        quartzScheduler.setConfigLocation(new ClassPathResource(QUARTZ_PROPERTIES));
        quartzScheduler.setSchedulerName(XXX);
        quartzScheduler.setApplicationContextSchedulerContextKey("applicationContext");
        quartzScheduler.setDataSource(dataSource);
        quartzScheduler.setTaskExecutor(taskExecutor);
        quartzScheduler.setJobDetails(jobDetails);
        return quartzScheduler;
    }

Quartz.properties

        # Default Properties file for use by StdSchedulerFactory
        # to create a Quartz Scheduler Instance, if a different
        # properties file is not explicitly specified.
        org.quartz.jobStore.misfireThreshold: 60000
        org.quartz.jobStore.driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate
        org.quartz.jobStore.tablePrefix: QRTZ_
        org.quartz.jobStore.useProperties: true
        org.quartz.scheduler.skipUpdateCheck: true