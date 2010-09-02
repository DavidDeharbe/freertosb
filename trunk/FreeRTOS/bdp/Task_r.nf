Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(Task_r))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(Task_r))==(Machine(Task));
  Level(Refinement(Task_r))==(1);
  Upper_Level(Refinement(Task_r))==(Machine(Task))
END
&
THEORY LoadedStructureX IS
  Refinement(Task_r)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(Task_r))==(FreeRTOSConfig,Types)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(Task_r))==(?);
  List_Includes(Refinement(Task_r))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(Task_r))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(Task_r))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(Task_r))==(?);
  Context_List_Variables(Refinement(Task_r))==(?);
  Abstract_List_Variables(Refinement(Task_r))==(unblocked,idle,running,suspended,runable,blocked,tasks,active);
  Local_List_Variables(Refinement(Task_r))==(unblocked,t_bpriority,t_priority,idle,running,suspended,runable,blocked,tasks,active);
  List_Variables(Refinement(Task_r))==(unblocked,t_bpriority,t_priority,idle,running,suspended,runable,blocked,tasks,active);
  External_List_Variables(Refinement(Task_r))==(unblocked,t_bpriority,t_priority,idle,running,suspended,runable,blocked,tasks,active)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(Task_r))==(?);
  Abstract_List_VisibleVariables(Refinement(Task_r))==(?);
  External_List_VisibleVariables(Refinement(Task_r))==(?);
  Expanded_List_VisibleVariables(Refinement(Task_r))==(?);
  List_VisibleVariables(Refinement(Task_r))==(?);
  Internal_List_VisibleVariables(Refinement(Task_r))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(Task_r))==(t_bpriority,t_priority)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(Task_r))==(btrue);
  Expanded_List_Invariant(Refinement(Task_r))==(btrue);
  Abstract_List_Invariant(Refinement(Task_r))==(active: BOOL & tasks: FIN(TASK) & blocked: FIN(TASK) & blocked <: tasks & unblocked: FIN(TASK) & unblocked <: blocked & runable: FIN(TASK) & runable <: tasks & suspended: FIN(TASK) & suspended <: tasks & runable/\blocked = {} & blocked/\suspended = {} & suspended/\runable = {} & tasks = suspended\/blocked\/runable & running: TASK & idle: TASK & (active = TRUE => runable/={} & running: runable & idle: runable & TASK_NULL/:tasks));
  Context_List_Invariant(Refinement(Task_r))==(btrue);
  List_Invariant(Refinement(Task_r))==(active: BOOL & t_priority: TASK +-> PRIORITY & dom(t_priority) = tasks & t_bpriority: TASK +-> PRIORITY & dom(t_bpriority) = tasks & (active = TRUE => t_priority(idle) = IDLE_PRIORITY & t_priority(running) = max(t_priority[runable]) & IDLE_PRIORITY<=min(t_priority[tasks])))
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(Task_r))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Refinement(Task_r))==(btrue);
  Abstract_List_Assertions(Refinement(Task_r))==(active = TRUE => runable/={};active = TRUE => tasks/={};active = TRUE => idle: runable;active = TRUE => idle/:blocked;active = TRUE => idle/:suspended;active = TRUE => idle/=TASK_NULL;active = TRUE => running: runable;active = TRUE => running/:blocked;active = TRUE => running/:suspended);
  Context_List_Assertions(Refinement(Task_r))==(configMAX_PRIORITIES: NATURAL & BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT);
  List_Assertions(Refinement(Task_r))==(PRIORITY <: NATURAL;active = TRUE => running: dom(t_priority);active = TRUE => {t_priority[runable]} <: FIN(PRIORITY);active = TRUE => !atask.(atask: TASK & atask: runable & atask/=idle => runable/={atask});active = TRUE => t_priority[runable]/={};!(tasks,t_priority,rtask).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks/={} & tasks <: dom(t_priority) & rtask: TASK & rtask: tasks & rtask: schedule_p(tasks,t_priority) => t_priority(rtask) = max(t_priority[tasks]));!(tasks,t_priority,rtask,dtask).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks/={} & tasks <: dom(t_priority) & rtask: TASK & rtask: tasks & t_priority(rtask) = max(t_priority[tasks]) & dtask: TASK & dtask: tasks & rtask/=dtask => t_priority(rtask) = max(t_priority[tasks-{dtask}]));!(tasks,t_priority,run,atask).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks/={} & tasks <: dom(t_priority) & run: TASK & run: tasks & t_priority(run) = max(t_priority[tasks]) & atask: TASK & atask/:tasks & t_priority(atask)<t_priority(run) => t_priority(run) = max(t_priority[tasks\/{atask}]));!(tasks,t_priority,rtask).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks <: dom(t_priority) & tasks/={} & rtask: TASK & rtask: tasks & tasks/={rtask} => max(t_priority[tasks-{rtask}])<=max(t_priority[tasks]));!(tasks,t_priority,rtask,priority).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks <: dom(t_priority) & tasks/={} & rtask: TASK & rtask: tasks & tasks/={rtask} & priority: PRIORITY & max(t_priority[tasks])<=priority & max(t_priority[tasks-{rtask}])<=max(t_priority[tasks]) => priority = max(t_priority[tasks-{rtask}]\/{priority}));!(tasks,t_priority,rtask,priority).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks <: dom(t_priority) & tasks/={} & rtask: TASK & rtask: tasks & tasks/={rtask} & priority: PRIORITY & priority+1<=max(t_priority[tasks]) & max(t_priority[tasks-{rtask}]) = max(t_priority[tasks]) => max(t_priority[tasks]) = max(t_priority[tasks-{rtask}]\/{priority})))
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(Task_r))==(active,tasks:=FALSE,{} || @(running$0).(running$0: TASK ==> running:=running$0) || @(idle$0).(idle$0: TASK ==> idle:=idle$0) || t_priority:={} || t_bpriority:={} || blocked,runable,suspended,unblocked:={},{},{},{});
  Context_List_Initialisation(Refinement(Task_r))==(skip);
  List_Initialisation(Refinement(Task_r))==(active:=FALSE || tasks:={} || running:: TASK || idle:: TASK || t_priority:={} || t_bpriority:={} || blocked,runable,suspended,unblocked:={},{},{},{})
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(Task_r))==(t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_removeFromEventList,t_setPriority,t_priorityInherit,t_returnPriority,t_suspendAll,t_incrementTick,t_beforeResumeAll);
  List_Operations(Refinement(Task_r))==(t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_removeFromEventList,t_setPriority,t_priorityInherit,t_returnPriority,t_suspendAll,t_incrementTick,t_beforeResumeAll)
END
&
THEORY ListInputX IS
  List_Input(Refinement(Task_r),t_beforeResumeAll)==(tickCount,tickIncrement);
  List_Input(Refinement(Task_r),t_incrementTick)==(tickCount);
  List_Input(Refinement(Task_r),t_suspendAll)==(?);
  List_Input(Refinement(Task_r),t_create)==(priority);
  List_Input(Refinement(Task_r),t_delete)==(atask);
  List_Input(Refinement(Task_r),t_yield)==(?);
  List_Input(Refinement(Task_r),t_suspend)==(stask);
  List_Input(Refinement(Task_r),t_resume)==(rtask);
  List_Input(Refinement(Task_r),t_getPriority)==(atask);
  List_Input(Refinement(Task_r),t_getCurrent)==(?);
  List_Input(Refinement(Task_r),t_getNumberOfTasks)==(?);
  List_Input(Refinement(Task_r),t_delayTask)==(ticks,task);
  List_Input(Refinement(Task_r),t_startScheduler)==(?);
  List_Input(Refinement(Task_r),t_endScheduler)==(?);
  List_Input(Refinement(Task_r),t_resumeAll)==(tunblocked);
  List_Input(Refinement(Task_r),t_unblock)==(task);
  List_Input(Refinement(Task_r),t_removeFromEventList)==(task);
  List_Input(Refinement(Task_r),t_setPriority)==(task,priority);
  List_Input(Refinement(Task_r),t_priorityInherit)==(holderTask,xTicksToWait);
  List_Input(Refinement(Task_r),t_returnPriority)==(btask)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(Task_r),t_beforeResumeAll)==(?);
  List_Output(Refinement(Task_r),t_incrementTick)==(?);
  List_Output(Refinement(Task_r),t_suspendAll)==(?);
  List_Output(Refinement(Task_r),t_create)==(result);
  List_Output(Refinement(Task_r),t_delete)==(?);
  List_Output(Refinement(Task_r),t_yield)==(?);
  List_Output(Refinement(Task_r),t_suspend)==(?);
  List_Output(Refinement(Task_r),t_resume)==(?);
  List_Output(Refinement(Task_r),t_getPriority)==(priority);
  List_Output(Refinement(Task_r),t_getCurrent)==(result);
  List_Output(Refinement(Task_r),t_getNumberOfTasks)==(result);
  List_Output(Refinement(Task_r),t_delayTask)==(?);
  List_Output(Refinement(Task_r),t_startScheduler)==(?);
  List_Output(Refinement(Task_r),t_endScheduler)==(?);
  List_Output(Refinement(Task_r),t_resumeAll)==(?);
  List_Output(Refinement(Task_r),t_unblock)==(?);
  List_Output(Refinement(Task_r),t_removeFromEventList)==(?);
  List_Output(Refinement(Task_r),t_setPriority)==(?);
  List_Output(Refinement(Task_r),t_priorityInherit)==(?);
  List_Output(Refinement(Task_r),t_returnPriority)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(Task_r),t_beforeResumeAll)==(t_beforeResumeAll(tickCount,tickIncrement));
  List_Header(Refinement(Task_r),t_incrementTick)==(t_incrementTick(tickCount));
  List_Header(Refinement(Task_r),t_suspendAll)==(t_suspendAll);
  List_Header(Refinement(Task_r),t_create)==(result <-- t_create(priority));
  List_Header(Refinement(Task_r),t_delete)==(t_delete(atask));
  List_Header(Refinement(Task_r),t_yield)==(t_yield);
  List_Header(Refinement(Task_r),t_suspend)==(t_suspend(stask));
  List_Header(Refinement(Task_r),t_resume)==(t_resume(rtask));
  List_Header(Refinement(Task_r),t_getPriority)==(priority <-- t_getPriority(atask));
  List_Header(Refinement(Task_r),t_getCurrent)==(result <-- t_getCurrent);
  List_Header(Refinement(Task_r),t_getNumberOfTasks)==(result <-- t_getNumberOfTasks);
  List_Header(Refinement(Task_r),t_delayTask)==(t_delayTask(ticks,task));
  List_Header(Refinement(Task_r),t_startScheduler)==(t_startScheduler);
  List_Header(Refinement(Task_r),t_endScheduler)==(t_endScheduler);
  List_Header(Refinement(Task_r),t_resumeAll)==(t_resumeAll(tunblocked));
  List_Header(Refinement(Task_r),t_unblock)==(t_unblock(task));
  List_Header(Refinement(Task_r),t_removeFromEventList)==(t_removeFromEventList(task));
  List_Header(Refinement(Task_r),t_setPriority)==(t_setPriority(task,priority));
  List_Header(Refinement(Task_r),t_priorityInherit)==(t_priorityInherit(holderTask,xTicksToWait));
  List_Header(Refinement(Task_r),t_returnPriority)==(t_returnPriority(btask))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(Task_r),t_beforeResumeAll)==(tickCount: TICK & tickIncrement: TICK);
  List_Precondition(Refinement(Task_r),t_beforeResumeAll)==(tickCount: TICK & tickIncrement: TICK);
  Own_Precondition(Refinement(Task_r),t_incrementTick)==(active = TRUE & tickCount: TICK);
  List_Precondition(Refinement(Task_r),t_incrementTick)==(active = TRUE & tickCount: TICK);
  Own_Precondition(Refinement(Task_r),t_suspendAll)==(active = TRUE);
  List_Precondition(Refinement(Task_r),t_suspendAll)==(active = TRUE);
  Own_Precondition(Refinement(Task_r),t_create)==(btrue);
  List_Precondition(Refinement(Task_r),t_create)==(priority: PRIORITY);
  Own_Precondition(Refinement(Task_r),t_delete)==(btrue);
  List_Precondition(Refinement(Task_r),t_delete)==(atask: TASK & atask: tasks & atask/=idle);
  Own_Precondition(Refinement(Task_r),t_yield)==(active = TRUE);
  List_Precondition(Refinement(Task_r),t_yield)==(active = TRUE & active = TRUE);
  Own_Precondition(Refinement(Task_r),t_suspend)==(btrue);
  List_Precondition(Refinement(Task_r),t_suspend)==(stask: TASK & stask: tasks & stask/=idle);
  Own_Precondition(Refinement(Task_r),t_resume)==(btrue);
  List_Precondition(Refinement(Task_r),t_resume)==(rtask: TASK & rtask: suspended & active = TRUE);
  Own_Precondition(Refinement(Task_r),t_getPriority)==(btrue);
  List_Precondition(Refinement(Task_r),t_getPriority)==(atask: TASK & atask: tasks);
  Own_Precondition(Refinement(Task_r),t_getCurrent)==(btrue);
  List_Precondition(Refinement(Task_r),t_getCurrent)==(btrue);
  Own_Precondition(Refinement(Task_r),t_getNumberOfTasks)==(btrue);
  List_Precondition(Refinement(Task_r),t_getNumberOfTasks)==(btrue);
  Own_Precondition(Refinement(Task_r),t_delayTask)==(btrue);
  List_Precondition(Refinement(Task_r),t_delayTask)==(task: TASK & task = running & running: runable & running/=idle & ticks: TICK);
  Own_Precondition(Refinement(Task_r),t_startScheduler)==(btrue);
  List_Precondition(Refinement(Task_r),t_startScheduler)==(active = FALSE);
  Own_Precondition(Refinement(Task_r),t_endScheduler)==(btrue);
  List_Precondition(Refinement(Task_r),t_endScheduler)==(active = TRUE);
  Own_Precondition(Refinement(Task_r),t_resumeAll)==(btrue);
  List_Precondition(Refinement(Task_r),t_resumeAll)==(tunblocked: FIN(TASK) & tunblocked <: blocked & tunblocked = unblocked);
  Own_Precondition(Refinement(Task_r),t_unblock)==(btrue);
  List_Precondition(Refinement(Task_r),t_unblock)==(task: TASK & task: blocked & active = TRUE);
  Own_Precondition(Refinement(Task_r),t_removeFromEventList)==(btrue);
  List_Precondition(Refinement(Task_r),t_removeFromEventList)==(task: TASK & task: blocked\/suspended & active = TRUE);
  Own_Precondition(Refinement(Task_r),t_setPriority)==(btrue);
  List_Precondition(Refinement(Task_r),t_setPriority)==(task: tasks & priority: PRIORITY & task/=idle & active = TRUE);
  Own_Precondition(Refinement(Task_r),t_priorityInherit)==(btrue);
  List_Precondition(Refinement(Task_r),t_priorityInherit)==(xTicksToWait: TICK & holderTask: tasks & holderTask/=idle & running/=idle & running: runable & active = TRUE);
  Own_Precondition(Refinement(Task_r),t_returnPriority)==(btrue);
  List_Precondition(Refinement(Task_r),t_returnPriority)==(btask: TASK & btask: tasks & btask: blocked\/suspended & active = TRUE & running/=idle)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(Task_r),t_beforeResumeAll)==(tickCount: TICK & tickIncrement: TICK | @n_unblocked.(n_unblocked: FIN(TASK) & n_unblocked <: blocked ==> unblocked:=n_unblocked));
  List_Substitution(Refinement(Task_r),t_beforeResumeAll)==(ANY n_unblocked WHERE n_unblocked: FIN(TASK) & n_unblocked <: blocked THEN unblocked:=n_unblocked END);
  Expanded_List_Substitution(Refinement(Task_r),t_incrementTick)==(active = TRUE & tickCount: TICK | @n_unblocked.(n_unblocked: FIN(TASK) & n_unblocked <: blocked ==> unblocked:=n_unblocked));
  List_Substitution(Refinement(Task_r),t_incrementTick)==(ANY n_unblocked WHERE n_unblocked: FIN(TASK) & n_unblocked <: blocked THEN unblocked:=n_unblocked END);
  Expanded_List_Substitution(Refinement(Task_r),t_suspendAll)==(active = TRUE | active:=FALSE);
  List_Substitution(Refinement(Task_r),t_suspendAll)==(active:=FALSE);
  Expanded_List_Substitution(Refinement(Task_r),t_returnPriority)==(btask: TASK & btask: tasks & btask: blocked\/suspended & active = TRUE & running/=idle | btask: blocked ==> (blocked:=blocked-{btask} || (btask: unblocked ==> unblocked:=unblocked-{btask} [] not(btask: unblocked) ==> skip)) [] not(btask: blocked) ==> skip || (btask: suspended ==> suspended:=suspended-{btask} [] not(btask: suspended) ==> skip) || @(n_runable,n_priority).(n_runable <: tasks & n_runable = runable\/{btask} & n_priority: TASK +-> PRIORITY & n_priority = t_priority<+{running|->t_bpriority(running)} ==> (runable:=n_runable || (t_bpriority(running)/=t_priority(running) ==> (t_priority:=n_priority || @(running$0).(running$0: schedule_p(n_runable,n_priority) ==> running:=running$0)) [] not(t_bpriority(running)/=t_priority(running)) ==> (t_priority(btask)>=t_priority(running) ==> @(running$0).(running$0: schedule_p(n_runable,t_priority) ==> running:=running$0) [] not(t_priority(btask)>=t_priority(running)) ==> skip)))));
  Expanded_List_Substitution(Refinement(Task_r),t_priorityInherit)==(xTicksToWait: TICK & holderTask: tasks & holderTask/=idle & running/=idle & running: runable & active = TRUE | @(n_runable,n_priority).(n_runable <: tasks & n_runable = runable-{running} & n_runable/={} & n_priority: TASK +-> PRIORITY & n_priority = t_priority<+{holderTask|->t_priority(running)} ==> (runable,blocked:=n_runable,blocked\/{running} || (t_priority(running)>t_priority(holderTask) ==> (t_priority,t_bpriority:=n_priority,t_bpriority<+{holderTask|->t_priority(holderTask)} || @(running$0).(running$0: schedule_p(n_runable,n_priority) ==> running:=running$0)) [] not(t_priority(running)>t_priority(holderTask)) ==> @(running$0).(running$0: schedule_p(n_runable,t_priority) ==> running:=running$0)))));
  Expanded_List_Substitution(Refinement(Task_r),t_setPriority)==(task: tasks & priority: PRIORITY & task/=idle & active = TRUE | @n_priority.(n_priority = t_priority<+{task|->priority} ==> (t_priority,t_bpriority:=n_priority,t_bpriority<+{task|->priority} || (task: runable ==> (t_priority(running)<=priority ==> (task/=running ==> @(running$0).(running$0: schedule_p(runable,n_priority) ==> running:=running$0) [] not(task/=running) ==> skip) [] not(t_priority(running)<=priority) ==> (task = running ==> @(running$0).(running$0: schedule_p(runable,n_priority) ==> running:=running$0) [] not(task = running) ==> skip)) [] not(task: runable) ==> skip))));
  Expanded_List_Substitution(Refinement(Task_r),t_removeFromEventList)==(task: TASK & task: blocked\/suspended & active = TRUE | task: blocked ==> (blocked:=blocked-{task} || (task: unblocked ==> unblocked:=unblocked-{task} [] not(task: unblocked) ==> skip)) [] not(task: blocked) ==> skip || (task: suspended ==> suspended:=suspended-{task} [] not(task: suspended) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{task} ==> (runable:=n_runable || (t_priority(task)>=t_priority(running) ==> @(running$0).(running$0: schedule_p(n_runable,t_priority) ==> running:=running$0) [] not(t_priority(task)>=t_priority(running)) ==> skip))));
  Expanded_List_Substitution(Refinement(Task_r),t_unblock)==(task: TASK & task: blocked & active = TRUE | blocked:=blocked-{task} || (task: unblocked ==> unblocked:=unblocked-{task} [] not(task: unblocked) ==> skip) || @n_runable.(n_runable <: tasks & n_runable = runable\/{task} ==> (runable:=n_runable || (t_priority(task)>=t_priority(running) ==> @(running$0).(running$0: schedule_p(n_runable,t_priority) ==> running:=running$0) [] not(t_priority(task)>=t_priority(running)) ==> skip))));
  Expanded_List_Substitution(Refinement(Task_r),t_resumeAll)==(tunblocked: FIN(TASK) & tunblocked <: blocked & tunblocked = unblocked | tunblocked/={} ==> (@n_runable.(n_runable <: tasks & n_runable = runable\/tunblocked ==> (runable:=n_runable || @(running$0).(running$0: schedule_p(n_runable,t_priority) ==> running:=running$0))) || blocked:=blocked-tunblocked || unblocked:={}) [] not(tunblocked/={}) ==> skip);
  Expanded_List_Substitution(Refinement(Task_r),t_endScheduler)==(active = TRUE | active,tasks,t_priority,t_bpriority,blocked,runable,suspended,unblocked:=FALSE,{},{},{},{},{},{},{});
  Expanded_List_Substitution(Refinement(Task_r),t_startScheduler)==(active = FALSE | active:=TRUE || @(idle_task,n_runable).(idle_task: TASK & idle_task/:tasks & n_runable <: tasks & n_runable = runable\/{idle_task} ==> (idle,tasks:=idle_task,tasks\/{idle_task} || @(running$0).(running$0: schedule_p(n_runable,t_priority) ==> running:=running$0))));
  Expanded_List_Substitution(Refinement(Task_r),t_delayTask)==(task: TASK & task = running & running: runable & running/=idle & ticks: TICK | @n_runable.(n_runable <: tasks & n_runable = runable-{running} & n_runable/={} ==> (runable:=n_runable || @(running$0).(running$0: schedule_p(n_runable,t_priority) ==> running:=running$0))) || blocked:=blocked\/{running});
  Expanded_List_Substitution(Refinement(Task_r),t_getNumberOfTasks)==(btrue | result:=card(tasks));
  Expanded_List_Substitution(Refinement(Task_r),t_getCurrent)==(btrue | result:=running);
  Expanded_List_Substitution(Refinement(Task_r),t_getPriority)==(atask: TASK & atask: tasks | priority:=t_priority(atask));
  Expanded_List_Substitution(Refinement(Task_r),t_resume)==(rtask: TASK & rtask: suspended & active = TRUE | @n_runable.(n_runable <: tasks & n_runable = runable\/{rtask} ==> (runable:=n_runable || (t_priority(rtask)>=t_priority(running) ==> @(running$0).(running$0: schedule_p(n_runable,t_priority) ==> running:=running$0) [] not(t_priority(rtask)>=t_priority(running)) ==> skip))) || suspended:=suspended-{rtask});
  Expanded_List_Substitution(Refinement(Task_r),t_suspend)==(stask: TASK & stask: tasks & stask/=idle | stask: runable ==> @n_runable.(n_runable <: tasks & n_runable = runable-{stask} & n_runable/={} ==> (runable:=n_runable || (stask = running ==> @(running$0).(running$0: schedule_p(n_runable,t_priority) ==> running:=running$0) [] not(stask = running) ==> skip))) [] not(stask: runable) ==> (stask: blocked ==> (blocked:=blocked-{stask} || (stask: unblocked ==> unblocked:=unblocked-{stask} [] not(stask: unblocked) ==> skip)) [] not(stask: blocked) ==> skip) || suspended:=suspended\/{stask});
  Expanded_List_Substitution(Refinement(Task_r),t_yield)==(active = TRUE & active = TRUE | @(running$0).(running$0: schedule_p(runable,t_priority) ==> running:=running$0));
  Expanded_List_Substitution(Refinement(Task_r),t_delete)==(atask: TASK & atask: tasks & atask/=idle | @(n_runable,n_priority).(n_runable <: tasks & n_runable = runable-{atask} & n_runable/={} & n_priority: TASK +-> PRIORITY & n_priority = {atask}<<|t_priority ==> (tasks,t_priority,t_bpriority:=tasks-{atask},n_priority,{atask}<<|t_bpriority || (atask: runable ==> (runable:=n_runable || (atask = running ==> (active = TRUE ==> @(running$0).(running$0: schedule_p(n_runable,n_priority) ==> running:=running$0) [] not(active = TRUE) ==> skip) [] not(atask = running) ==> skip)) [] not(atask: runable) ==> (atask: blocked ==> (blocked:=blocked-{atask} || (atask: unblocked ==> unblocked:=unblocked-{atask} [] not(atask: unblocked) ==> skip)) [] not(atask: blocked) ==> (atask: suspended ==> suspended:=suspended-{atask} [] not(atask: suspended) ==> skip))))));
  Expanded_List_Substitution(Refinement(Task_r),t_create)==(priority: PRIORITY | @(task,n_runable,n_priority).(task: TASK & task/:tasks & n_runable <: tasks & n_runable = runable\/{task} & task/=TASK_NULL & n_priority: TASK +-> PRIORITY & n_priority = t_priority\/{task|->priority} ==> (tasks,runable,t_priority,t_bpriority:=tasks\/{task},n_runable,n_priority,t_bpriority\/{task|->priority} || (active = TRUE ==> (priority>=t_priority(running) ==> @(running$0).(running$0: schedule_p(n_runable,n_priority) ==> running:=running$0) [] not(priority>=t_priority(running)) ==> skip) [] not(active = TRUE) ==> (runable = {} ==> running:=task [] not(runable = {}) ==> (priority>=t_priority(running) ==> @(running$0).(running$0: schedule_p(n_runable,n_priority) ==> running:=running$0) [] not(priority>=t_priority(running)) ==> skip))) || result:=task)));
  List_Substitution(Refinement(Task_r),t_create)==(ANY task,n_runable,n_priority WHERE task: TASK & task/:tasks & n_runable <: tasks & n_runable = runable\/{task} & task/=TASK_NULL & n_priority: TASK +-> PRIORITY & n_priority = t_priority\/{task|->priority} THEN tasks:=tasks\/{task} || runable:=n_runable || t_priority:=n_priority || t_bpriority:=t_bpriority\/{task|->priority} || IF active = TRUE THEN IF priority>=t_priority(running) THEN running:: schedule_p(n_runable,n_priority) END ELSE IF runable = {} THEN running:=task ELSE IF priority>=t_priority(running) THEN running:: schedule_p(n_runable,n_priority) END END END || result:=task END);
  List_Substitution(Refinement(Task_r),t_delete)==(ANY n_runable,n_priority WHERE n_runable <: tasks & n_runable = runable-{atask} & n_runable/={} & n_priority: TASK +-> PRIORITY & n_priority = {atask}<<|t_priority THEN tasks:=tasks-{atask} || t_priority:=n_priority || t_bpriority:={atask}<<|t_bpriority || IF atask: runable THEN runable:=n_runable || IF atask = running THEN IF active = TRUE THEN running:: schedule_p(n_runable,n_priority) END END ELSIF atask: blocked THEN blocked:=blocked-{atask} || IF atask: unblocked THEN unblocked:=unblocked-{atask} END ELSIF atask: suspended THEN suspended:=suspended-{atask} END END);
  List_Substitution(Refinement(Task_r),t_yield)==(running:: schedule_p(runable,t_priority));
  List_Substitution(Refinement(Task_r),t_suspend)==(IF stask: runable THEN ANY n_runable WHERE n_runable <: tasks & n_runable = runable-{stask} & n_runable/={} THEN runable:=n_runable || IF stask = running THEN running:: schedule_p(n_runable,t_priority) END END ELSIF stask: blocked THEN blocked:=blocked-{stask} || IF stask: unblocked THEN unblocked:=unblocked-{stask} END END || suspended:=suspended\/{stask});
  List_Substitution(Refinement(Task_r),t_resume)==(ANY n_runable WHERE n_runable <: tasks & n_runable = runable\/{rtask} THEN runable:=n_runable || IF t_priority(rtask)>=t_priority(running) THEN running:: schedule_p(n_runable,t_priority) END END || suspended:=suspended-{rtask});
  List_Substitution(Refinement(Task_r),t_getPriority)==(priority:=t_priority(atask));
  List_Substitution(Refinement(Task_r),t_getCurrent)==(result:=running);
  List_Substitution(Refinement(Task_r),t_getNumberOfTasks)==(result:=card(tasks));
  List_Substitution(Refinement(Task_r),t_delayTask)==(ANY n_runable WHERE n_runable <: tasks & n_runable = runable-{running} & n_runable/={} THEN runable:=n_runable || running:: schedule_p(n_runable,t_priority) END || blocked:=blocked\/{running});
  List_Substitution(Refinement(Task_r),t_startScheduler)==(active:=TRUE || ANY idle_task,n_runable WHERE idle_task: TASK & idle_task/:tasks & n_runable <: tasks & n_runable = runable\/{idle_task} THEN idle:=idle_task || tasks:=tasks\/{idle_task} || running:: schedule_p(n_runable,t_priority) END);
  List_Substitution(Refinement(Task_r),t_endScheduler)==(active:=FALSE || tasks:={} || t_priority:={} || t_bpriority:={} || blocked,runable,suspended,unblocked:={},{},{},{});
  List_Substitution(Refinement(Task_r),t_resumeAll)==(IF tunblocked/={} THEN ANY n_runable WHERE n_runable <: tasks & n_runable = runable\/tunblocked THEN runable:=n_runable || running:: schedule_p(n_runable,t_priority) END || blocked:=blocked-tunblocked || unblocked:={} END);
  List_Substitution(Refinement(Task_r),t_unblock)==(blocked:=blocked-{task} || IF task: unblocked THEN unblocked:=unblocked-{task} END || ANY n_runable WHERE n_runable <: tasks & n_runable = runable\/{task} THEN runable:=n_runable || IF t_priority(task)>=t_priority(running) THEN running:: schedule_p(n_runable,t_priority) END END);
  List_Substitution(Refinement(Task_r),t_removeFromEventList)==(IF task: blocked THEN blocked:=blocked-{task} || IF task: unblocked THEN unblocked:=unblocked-{task} END END || IF task: suspended THEN suspended:=suspended-{task} END || ANY n_runable WHERE n_runable <: tasks & n_runable = runable\/{task} THEN runable:=n_runable || IF t_priority(task)>=t_priority(running) THEN running:: schedule_p(n_runable,t_priority) END END);
  List_Substitution(Refinement(Task_r),t_setPriority)==(ANY n_priority WHERE n_priority = t_priority<+{task|->priority} THEN t_priority:=n_priority || t_bpriority(task):=priority || IF task: runable THEN IF t_priority(running)<=priority THEN IF task/=running THEN running:: schedule_p(runable,n_priority) END ELSE IF task = running THEN running:: schedule_p(runable,n_priority) END END END END);
  List_Substitution(Refinement(Task_r),t_priorityInherit)==(ANY n_runable,n_priority WHERE n_runable <: tasks & n_runable = runable-{running} & n_runable/={} & n_priority: TASK +-> PRIORITY & n_priority = t_priority<+{holderTask|->t_priority(running)} THEN runable:=n_runable || blocked:=blocked\/{running} || IF t_priority(running)>t_priority(holderTask) THEN t_priority:=n_priority || t_bpriority(holderTask):=t_priority(holderTask) || running:: schedule_p(n_runable,n_priority) ELSE running:: schedule_p(n_runable,t_priority) END END);
  List_Substitution(Refinement(Task_r),t_returnPriority)==(IF btask: blocked THEN blocked:=blocked-{btask} || IF btask: unblocked THEN unblocked:=unblocked-{btask} END END || IF btask: suspended THEN suspended:=suspended-{btask} END || ANY n_runable,n_priority WHERE n_runable <: tasks & n_runable = runable\/{btask} & n_priority: TASK +-> PRIORITY & n_priority = t_priority<+{running|->t_bpriority(running)} THEN runable:=n_runable || IF t_bpriority(running)/=t_priority(running) THEN t_priority:=n_priority || running:: schedule_p(n_runable,n_priority) ELSIF t_priority(btask)>=t_priority(running) THEN running:: schedule_p(n_runable,t_priority) END END)
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(Task_r))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Refinement(Task_r),Machine(FreeRTOSConfig))==(?);
  List_Instanciated_Parameters(Refinement(Task_r),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(Task_r))==(btrue);
  List_Context_Constraints(Refinement(Task_r))==(btrue)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(Task_r))==(max_prt,schedule_p);
  Inherited_List_Constants(Refinement(Task_r))==(?);
  List_Constants(Refinement(Task_r))==(max_prt,schedule_p)
END
&
THEORY ListSetsX IS
  Set_Definition(Refinement(Task_r),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Context_List_Enumerated(Refinement(Task_r))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Context_List_Defered(Refinement(Task_r))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,ITEM,QUEUE);
  Context_List_Sets(Refinement(Task_r))==(NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION);
  List_Valuable_Sets(Refinement(Task_r))==(?);
  Inherited_List_Enumerated(Refinement(Task_r))==(?);
  Inherited_List_Defered(Refinement(Task_r))==(?);
  Inherited_List_Sets(Refinement(Task_r))==(?);
  List_Enumerated(Refinement(Task_r))==(?);
  List_Defered(Refinement(Task_r))==(?);
  List_Sets(Refinement(Task_r))==(?);
  Set_Definition(Refinement(Task_r),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Refinement(Task_r),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(Task_r),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(Task_r))==(?);
  Expanded_List_HiddenConstants(Refinement(Task_r))==(?);
  List_HiddenConstants(Refinement(Task_r))==(?);
  External_List_HiddenConstants(Refinement(Task_r))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(Task_r))==(btrue);
  Context_List_Properties(Refinement(Task_r))==(configMAX_PRIORITIES: NAT & configMAX_PRIORITIES>=1 & configTOTAL_HEAP_SIZE: NAT & configTOTAL_HEAP_SIZE>=0 & configMINIMAL_STACK_SIZE: NAT & configMINIMAL_STACK_SIZE>=0 & INCLUDE_uxTaskPriorityGet: BIT & INCLUDE_vTaskDelete: BIT & INCLUDE_vTaskSuspend: BIT & INCLUDE_xTaskGetSchedulerState: BIT & INCLUDE_vTaskPrioritySet: BIT & INCLUDE_xTaskGetCurrentTaskHandle: BIT & INCLUDE_vTaskDelayUntil: BIT & INCLUDE_vTaskDelay: BIT & PRIORITY = 0..configMAX_PRIORITIES-1 & BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Inherited_List_Properties(Refinement(Task_r))==(btrue);
  List_Properties(Refinement(Task_r))==(max_prt: PRIORITY*PRIORITY --> PRIORITY & max_prt = %(tmp_mprt_ready,t_prt).(tmp_mprt_ready: PRIORITY & t_prt: PRIORITY | max({tmp_mprt_ready,t_prt})) & schedule_p: FIN(TASK)*(TASK +-> PRIORITY) +-> FIN(TASK) & schedule_p = %(tasks,t_priority).(tasks: FIN(TASK) & t_priority: TASK +-> PRIORITY & tasks/={} & tasks <: dom(t_priority) | tasks/\dom(t_priority|>{max(t_priority[tasks])})))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Refinement(Task_r),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Refinement(Task_r))==(SCHEDULER_STATE,COPY_POSITION,QUEUE_TYPE,ERROR_DEFINITION);
  Seen_Context_List_Invariant(Refinement(Task_r))==(btrue);
  Seen_Context_List_Assertions(Refinement(Task_r))==(BIT <: NATURAL & QUEUE_LENGTH <: QUEUE_QUANT);
  Seen_Context_List_Properties(Refinement(Task_r))==(BIT = 0..1 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & QUEUE_NULL: QUEUE & ITEM_NULL: ITEM & ITEM_EMPTY: ITEM & TASK_NULL: TASK & REMOVE_EVENT: TASK*POW(QUEUE)*(QUEUE +-> POW(TASK)) +-> (QUEUE +-> POW(TASK)) & REMOVE_EVENT = %(task,queues,pending).(task: TASK & queues: POW(QUEUE) & pending: QUEUE +-> POW(TASK) | %queue.(queue: queues & queue: dom(pending) | pending(queue)-{task})) & semGIVE_BLOCK_TIME: TICK & IDLE_PRIORITY: PRIORITY & IDLE_PRIORITY = 0 & QUEUE_LENGTH: POW(NAT) & QUEUE_LENGTH = 1..MAXINT & QUEUE_QUANT: POW(NAT) & QUEUE_QUANT = 0..MAXINT & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}) & QUEUE: FIN(INTEGER) & not(QUEUE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}) & COPY_POSITION: FIN(INTEGER) & not(COPY_POSITION = {}) & QUEUE_TYPE: FIN(INTEGER) & not(QUEUE_TYPE = {}) & ERROR_DEFINITION: FIN(INTEGER) & not(ERROR_DEFINITION = {}));
  Seen_List_Constraints(Refinement(Task_r))==(btrue);
  Seen_List_Operations(Refinement(Task_r),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Refinement(Task_r),Machine(Types))==(btrue);
  Seen_Internal_List_Operations(Refinement(Task_r),Machine(FreeRTOSConfig))==(?);
  Seen_List_Operations(Refinement(Task_r),Machine(FreeRTOSConfig))==(?);
  Seen_Expanded_List_Invariant(Refinement(Task_r),Machine(FreeRTOSConfig))==(btrue);
  Set_Definition(Refinement(Task_r),ERROR_DEFINITION)==({errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE});
  Set_Definition(Refinement(Task_r),QUEUE_TYPE)==({TQUE,TSEMAPH,TMUT});
  Set_Definition(Refinement(Task_r),COPY_POSITION)==({queueSEND_TO_BACK,queueSEND_TO_FRONT});
  Set_Definition(Refinement(Task_r),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED})
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(Task_r),t_beforeResumeAll)==(Var(n_unblocked) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_incrementTick)==(Var(n_unblocked) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_suspendAll)==(?);
  List_ANY_Var(Refinement(Task_r),t_create)==((Var(task) == atype(TASK,?,?)),(Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(n_priority) == SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))));
  List_ANY_Var(Refinement(Task_r),t_delete)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(n_priority) == SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))));
  List_ANY_Var(Refinement(Task_r),t_yield)==(?);
  List_ANY_Var(Refinement(Task_r),t_suspend)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_resume)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_getPriority)==(?);
  List_ANY_Var(Refinement(Task_r),t_getCurrent)==(?);
  List_ANY_Var(Refinement(Task_r),t_getNumberOfTasks)==(?);
  List_ANY_Var(Refinement(Task_r),t_delayTask)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_startScheduler)==((Var(idle_task) == atype(TASK,?,?)),(Var(n_runable) == SetOf(atype(TASK,?,?))));
  List_ANY_Var(Refinement(Task_r),t_endScheduler)==(?);
  List_ANY_Var(Refinement(Task_r),t_resumeAll)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_unblock)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_removeFromEventList)==(Var(n_runable) == SetOf(atype(TASK,?,?)));
  List_ANY_Var(Refinement(Task_r),t_setPriority)==(Var(n_priority) == SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));
  List_ANY_Var(Refinement(Task_r),t_priorityInherit)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(n_priority) == SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))));
  List_ANY_Var(Refinement(Task_r),t_returnPriority)==((Var(n_runable) == SetOf(atype(TASK,?,?))),(Var(n_priority) == SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))),(Var(n_unblocked) == SetOf(atype(TASK,?,?))));
  List_ANY_Var(Refinement(Task_r),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(Task_r)) == (max_prt,schedule_p | ? | unblocked,t_bpriority,t_priority,idle,running,suspended,runable,blocked,tasks,active | ? | t_create,t_delete,t_yield,t_suspend,t_resume,t_getPriority,t_getCurrent,t_getNumberOfTasks,t_delayTask,t_startScheduler,t_endScheduler,t_resumeAll,t_unblock,t_removeFromEventList,t_setPriority,t_priorityInherit,t_returnPriority | ? | seen(Machine(FreeRTOSConfig)),seen(Machine(Types)) | ? | Task_r);
  List_Of_HiddenCst_Ids(Refinement(Task_r)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(Task_r)) == (max_prt,schedule_p);
  List_Of_VisibleVar_Ids(Refinement(Task_r)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(Task_r)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,QUEUE_LENGTH,QUEUE_QUANT,NAME,PARAMETER,SCHEDULER_STATE,TASK,STACK,TASK_CODE,ITEM,COPY_POSITION,QUEUE,QUEUE_TYPE,ERROR_DEFINITION,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED,queueSEND_TO_BACK,queueSEND_TO_FRONT,TQUE,TSEMAPH,TMUT,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,errQUEUE_EMPTY,errQUEUE_FULL,pdPASS,pdFAIL,pdTRUE,pdFALSE | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (BIT,QUEUE_NULL,ITEM_NULL,TASK_NULL,ITEM_EMPTY,REMOVE_EVENT,PRIORITY,TICK,TICK_INCREMENT,MAX_DELAY,NULL_PARAMETER,semGIVE_BLOCK_TIME,IDLE_PRIORITY,QUEUE_LENGTH,QUEUE_QUANT);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?);
  List_Of_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil | ? | ? | ? | ? | ? | seen(Machine(Types)) | ? | FreeRTOSConfig);
  List_Of_HiddenCst_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(FreeRTOSConfig)) == (configMAX_PRIORITIES,configTOTAL_HEAP_SIZE,configMINIMAL_STACK_SIZE,INCLUDE_vTaskPrioritySet,INCLUDE_vTaskSuspend,INCLUDE_uxTaskPriorityGet,INCLUDE_vTaskDelete,INCLUDE_xTaskGetSchedulerState,INCLUDE_xTaskGetCurrentTaskHandle,INCLUDE_vTaskDelay,INCLUDE_vTaskDelayUntil);
  List_Of_VisibleVar_Ids(Machine(FreeRTOSConfig)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(FreeRTOSConfig)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Refinement(Task_r)) == (Type(max_prt) == Cst(SetOf(btype(INTEGER,"[PRIORITY","]PRIORITY")*btype(INTEGER,"[PRIORITY","]PRIORITY")*btype(INTEGER,"[PRIORITY","]PRIORITY")));Type(schedule_p) == Cst(SetOf(SetOf(atype(TASK,?,?))*SetOf(atype(TASK,?,?)*btype(INTEGER,?,?))*SetOf(atype(TASK,?,?)))))
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(Task_r)) == (Type(unblocked) == Mvl(SetOf(atype(TASK,?,?)));Type(t_bpriority) == Mvl(SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));Type(t_priority) == Mvl(SetOf(atype(TASK,?,?)*btype(INTEGER,?,?)));Type(idle) == Mvl(atype(TASK,?,?));Type(running) == Mvl(atype(TASK,?,?));Type(suspended) == Mvl(SetOf(atype(TASK,?,?)));Type(runable) == Mvl(SetOf(atype(TASK,?,?)));Type(blocked) == Mvl(SetOf(atype(TASK,?,?)));Type(tasks) == Mvl(SetOf(atype(TASK,?,?)));Type(active) == Mvl(btype(BOOL,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(Task_r)) == (Type(t_beforeResumeAll) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(t_incrementTick) == Cst(No_type,btype(INTEGER,?,?));Type(t_suspendAll) == Cst(No_type,No_type);Type(t_returnPriority) == Cst(No_type,atype(TASK,?,?));Type(t_priorityInherit) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(t_setPriority) == Cst(No_type,atype(TASK,?,?)*btype(INTEGER,?,?));Type(t_removeFromEventList) == Cst(No_type,atype(TASK,?,?));Type(t_unblock) == Cst(No_type,atype(TASK,?,?));Type(t_resumeAll) == Cst(No_type,SetOf(atype(TASK,?,?)));Type(t_endScheduler) == Cst(No_type,No_type);Type(t_startScheduler) == Cst(No_type,No_type);Type(t_delayTask) == Cst(No_type,btype(INTEGER,?,?)*atype(TASK,?,?));Type(t_getNumberOfTasks) == Cst(btype(INTEGER,?,?),No_type);Type(t_getCurrent) == Cst(atype(TASK,?,?),No_type);Type(t_getPriority) == Cst(btype(INTEGER,"[PRIORITY","]PRIORITY"),atype(TASK,?,?));Type(t_resume) == Cst(No_type,atype(TASK,?,?));Type(t_suspend) == Cst(No_type,atype(TASK,?,?));Type(t_yield) == Cst(No_type,No_type);Type(t_delete) == Cst(No_type,atype(TASK,?,?));Type(t_create) == Cst(atype(TASK,?,?),btype(INTEGER,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  event_b_project == KO;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO
END
)
