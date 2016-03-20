
Gives you:
* A common structure for code that we need to actually run.  You have your
  modules, you have compiled them to executable beam code. But how do you make
  use of other peoples code? If an external module exposes a service to you via
  processes, you need to make sure those processes are started before you send
  messages to them. A specification for how code of this kind should be
  structured facilitates composition by making it clear how one would
  initialize a dependencies process and supervision tree.
  * Function -> Module -> Process/Supervision Tree -> OTP/Application
* A way to handle dependencies. You may depend on other applications that are
  structured similarly. Or libraries. Either way, OTP/Applications defines how
  these things should be combined. For instance, an applications dependencies
  will be started before it itself is started.
* A way to handle application configuration. With a hierarchical configuration
  structure so that config can be overridden at multiple levels.


Defines a way to package modules, that together do some work, or provide some
service to other applications, should be structured. Applications have an
explicit *lifecycle*, they define `start/2` and `stop/1`.

