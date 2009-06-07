Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Scheduler))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Scheduler))==(Machine(Scheduler));
  Level(Machine(Scheduler))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Scheduler)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Scheduler))==(Types)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Scheduler))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Scheduler))==(?);
  List_Includes(Machine(Scheduler))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Scheduler))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Scheduler))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Scheduler))==(?);
  Context_List_Variables(Machine(Scheduler))==(?);
  Abstract_List_Variables(Machine(Scheduler))==(?);
  Local_List_Variables(Machine(Scheduler))==(scheduler);
  List_Variables(Machine(Scheduler))==(scheduler);
  External_List_Variables(Machine(Scheduler))==(scheduler)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Scheduler))==(?);
  Abstract_List_VisibleVariables(Machine(Scheduler))==(?);
  External_List_VisibleVariables(Machine(Scheduler))==(?);
  Expanded_List_VisibleVariables(Machine(Scheduler))==(?);
  List_VisibleVariables(Machine(Scheduler))==(?);
  Internal_List_VisibleVariables(Machine(Scheduler))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Scheduler))==(btrue);
  Gluing_List_Invariant(Machine(Scheduler))==(btrue);
  Expanded_List_Invariant(Machine(Scheduler))==(btrue);
  Abstract_List_Invariant(Machine(Scheduler))==(btrue);
  Context_List_Invariant(Machine(Scheduler))==(btrue);
  List_Invariant(Machine(Scheduler))==(scheduler: SCHEDULER_STATE)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Scheduler))==(btrue);
  Abstract_List_Assertions(Machine(Scheduler))==(btrue);
  Context_List_Assertions(Machine(Scheduler))==(ERROR_DEFINITION <: INTEGER & BIT <: NATURAL);
  List_Assertions(Machine(Scheduler))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Scheduler))==(scheduler:=taskSCHEDULER_NOT_STARTED);
  Context_List_Initialisation(Machine(Scheduler))==(skip);
  List_Initialisation(Machine(Scheduler))==(scheduler:=taskSCHEDULER_NOT_STARTED)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Scheduler))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Scheduler),Machine(Types))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Scheduler))==(btrue);
  List_Constraints(Machine(Scheduler))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Scheduler))==(stateScheduler,startScheduler,stopScheduler,suspendScheduler,resumeScheduler);
  List_Operations(Machine(Scheduler))==(stateScheduler,startScheduler,stopScheduler,suspendScheduler,resumeScheduler)
END
&
THEORY ListInputX IS
  List_Input(Machine(Scheduler),stateScheduler)==(?);
  List_Input(Machine(Scheduler),startScheduler)==(?);
  List_Input(Machine(Scheduler),stopScheduler)==(?);
  List_Input(Machine(Scheduler),suspendScheduler)==(?);
  List_Input(Machine(Scheduler),resumeScheduler)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Scheduler),stateScheduler)==(state);
  List_Output(Machine(Scheduler),startScheduler)==(?);
  List_Output(Machine(Scheduler),stopScheduler)==(?);
  List_Output(Machine(Scheduler),suspendScheduler)==(?);
  List_Output(Machine(Scheduler),resumeScheduler)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Scheduler),stateScheduler)==(state <-- stateScheduler);
  List_Header(Machine(Scheduler),startScheduler)==(startScheduler);
  List_Header(Machine(Scheduler),stopScheduler)==(stopScheduler);
  List_Header(Machine(Scheduler),suspendScheduler)==(suspendScheduler);
  List_Header(Machine(Scheduler),resumeScheduler)==(resumeScheduler)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Scheduler),stateScheduler)==(btrue);
  List_Precondition(Machine(Scheduler),startScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED);
  List_Precondition(Machine(Scheduler),stopScheduler)==(scheduler = taskSCHEDULER_RUNNING);
  List_Precondition(Machine(Scheduler),suspendScheduler)==(scheduler = taskSCHEDULER_RUNNING);
  List_Precondition(Machine(Scheduler),resumeScheduler)==(scheduler = taskSCHEDULER_SUSPENDED)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Scheduler),resumeScheduler)==(scheduler = taskSCHEDULER_SUSPENDED | scheduler:=taskSCHEDULER_RUNNING);
  Expanded_List_Substitution(Machine(Scheduler),suspendScheduler)==(scheduler = taskSCHEDULER_RUNNING | scheduler:=taskSCHEDULER_SUSPENDED);
  Expanded_List_Substitution(Machine(Scheduler),stopScheduler)==(scheduler = taskSCHEDULER_RUNNING | scheduler:=taskSCHEDULER_NOT_STARTED);
  Expanded_List_Substitution(Machine(Scheduler),startScheduler)==(scheduler = taskSCHEDULER_NOT_STARTED | scheduler:=taskSCHEDULER_RUNNING);
  Expanded_List_Substitution(Machine(Scheduler),stateScheduler)==(btrue | state:=scheduler);
  List_Substitution(Machine(Scheduler),stateScheduler)==(state:=scheduler);
  List_Substitution(Machine(Scheduler),startScheduler)==(scheduler:=taskSCHEDULER_RUNNING);
  List_Substitution(Machine(Scheduler),stopScheduler)==(scheduler:=taskSCHEDULER_NOT_STARTED);
  List_Substitution(Machine(Scheduler),suspendScheduler)==(scheduler:=taskSCHEDULER_SUSPENDED);
  List_Substitution(Machine(Scheduler),resumeScheduler)==(scheduler:=taskSCHEDULER_RUNNING)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Scheduler))==(?);
  Inherited_List_Constants(Machine(Scheduler))==(?);
  List_Constants(Machine(Scheduler))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Scheduler),SCHEDULER_STATE)==({taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED});
  Context_List_Enumerated(Machine(Scheduler))==(SCHEDULER_STATE);
  Context_List_Defered(Machine(Scheduler))==(NAME,PARAMETER,TASK,STACK,TASK_CODE);
  Context_List_Sets(Machine(Scheduler))==(NAME,PARAMETER,TASK,STACK,TASK_CODE,SCHEDULER_STATE);
  List_Valuable_Sets(Machine(Scheduler))==(?);
  Inherited_List_Enumerated(Machine(Scheduler))==(?);
  Inherited_List_Defered(Machine(Scheduler))==(?);
  Inherited_List_Sets(Machine(Scheduler))==(?);
  List_Enumerated(Machine(Scheduler))==(?);
  List_Defered(Machine(Scheduler))==(?);
  List_Sets(Machine(Scheduler))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Scheduler))==(?);
  Expanded_List_HiddenConstants(Machine(Scheduler))==(?);
  List_HiddenConstants(Machine(Scheduler))==(?);
  External_List_HiddenConstants(Machine(Scheduler))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Scheduler))==(btrue);
  Context_List_Properties(Machine(Scheduler))==(BIT = 0..1 & pdTRUE: BIT & pdTRUE = 1 & pdFALSE: BIT & pdFALSE = 0 & pdPASS: BIT & pdPASS = 1 & pdFAIL: BIT & pdFAIL = 0 & errQUEUE_EMPTY: BIT & errQUEUE_EMPTY = 0 & errQUEUE_FULL: BIT & errQUEUE_FULL = 0 & ERROR_DEFINITION = -5.. -1 & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY: ERROR_DEFINITION & errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY = -1 & errNO_TASK_TO_RUN: ERROR_DEFINITION & errNO_TASK_TO_RUN = -2 & errQUEUE_BLOCKED: ERROR_DEFINITION & errQUEUE_BLOCKED = -4 & errQUEUE_YIELD: ERROR_DEFINITION & errQUEUE_YIELD = -5 & MAX_DELAY: 0..MAXINT & 1<=MAX_DELAY & NULL_PARAMETER: PARAMETER & PRIORITY: POW(NAT) & TICK: POW(NAT) & TICK = 0..MAX_DELAY & TICK_INCREMENT: TICK*TICK --> TICK & TICK_INCREMENT = %(tick,inc).(tick: TICK & inc: TICK | (tick+inc) mod MAX_DELAY) & NAME: FIN(INTEGER) & not(NAME = {}) & PARAMETER: FIN(INTEGER) & not(PARAMETER = {}) & TASK: FIN(INTEGER) & not(TASK = {}) & STACK: FIN(INTEGER) & not(STACK = {}) & TASK_CODE: FIN(INTEGER) & not(TASK_CODE = {}) & SCHEDULER_STATE: FIN(INTEGER) & not(SCHEDULER_STATE = {}));
  Inherited_List_Properties(Machine(Scheduler))==(btrue);
  List_Properties(Machine(Scheduler))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Scheduler),Machine(Types))==(?);
  Seen_Context_List_Enumerated(Machine(Scheduler))==(?);
  Seen_Context_List_Invariant(Machine(Scheduler))==(btrue);
  Seen_Context_List_Assertions(Machine(Scheduler))==(btrue);
  Seen_Context_List_Properties(Machine(Scheduler))==(btrue);
  Seen_List_Constraints(Machine(Scheduler))==(btrue);
  Seen_List_Operations(Machine(Scheduler),Machine(Types))==(?);
  Seen_Expanded_List_Invariant(Machine(Scheduler),Machine(Types))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Scheduler),stateScheduler)==(?);
  List_ANY_Var(Machine(Scheduler),startScheduler)==(?);
  List_ANY_Var(Machine(Scheduler),stopScheduler)==(?);
  List_ANY_Var(Machine(Scheduler),suspendScheduler)==(?);
  List_ANY_Var(Machine(Scheduler),resumeScheduler)==(?);
  List_ANY_Var(Machine(Scheduler),?)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Scheduler)) == (? | ? | scheduler | ? | stateScheduler,startScheduler,stopScheduler,suspendScheduler,resumeScheduler | ? | seen(Machine(Types)) | ? | Scheduler);
  List_Of_HiddenCst_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Scheduler)) == (?);
  List_Of_VisibleVar_Ids(Machine(Scheduler)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Scheduler)) == (?: ?);
  List_Of_Ids(Machine(Types)) == (PRIORITY,TICK,TICK_INCREMENT,BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER,NAME,PARAMETER,TASK,STACK,TASK_CODE,SCHEDULER_STATE,taskSCHEDULER_NOT_STARTED,taskSCHEDULER_RUNNING,taskSCHEDULER_SUSPENDED | ? | ? | ? | ? | ? | ? | ? | Types);
  List_Of_HiddenCst_Ids(Machine(Types)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Types)) == (PRIORITY,TICK,TICK_INCREMENT,BIT,pdTRUE,pdFALSE,pdPASS,pdFAIL,errQUEUE_EMPTY,errQUEUE_FULL,ERROR_DEFINITION,errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY,errNO_TASK_TO_RUN,errQUEUE_BLOCKED,errQUEUE_YIELD,MAX_DELAY,NULL_PARAMETER);
  List_Of_VisibleVar_Ids(Machine(Types)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Types)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Scheduler)) == (Type(scheduler) == Mvl(etype(SCHEDULER_STATE,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Scheduler)) == (Type(resumeScheduler) == Cst(No_type,No_type);Type(suspendScheduler) == Cst(No_type,No_type);Type(stopScheduler) == Cst(No_type,No_type);Type(startScheduler) == Cst(No_type,No_type);Type(stateScheduler) == Cst(etype(SCHEDULER_STATE,?,?),No_type));
  Observers(Machine(Scheduler)) == (Type(stateScheduler) == Cst(etype(SCHEDULER_STATE,?,?),No_type))
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