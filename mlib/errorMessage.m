printf('Error. Message: %s\nFile: %s\nLine: %s\nScope: %s\nContext: %s\n' , lasterror.message , lasterror.stack.file, num2str(lasterror.stack.line) , lasterror.stack.scope , lasterror.stack.context);

