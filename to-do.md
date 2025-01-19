┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃               To-Do Command Suite Documentation               ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛


                            SYNOPSIS                             

                                                                 
 to-do [global options] <command> [command options] [arguments]  
                                                                 


                           DESCRIPTION                           

The to-do command suite is a task management tool that allows    
users to create, list, and complete tasks. Each task can have a  
name and a priority, with new tasks defaulting to the lowest     
priority unless specified otherwise.                             


                             OPTIONS                             

 • Global Options:                                               
    • -f : Flag to modify global behavior (details depend on     
      command context).                                          
 • Command Options:                                              
    • new:                                                       
       • -f : Add the new task to the top of the list.           
       • -p priority : Set the task's priority, with 1 being the 
         highest.                                                


                            EXAMPLES                             

 • Create a new task:                                            
                                                                 
    to-do new "Task Name" -p 1                                   
                                                                 
   Adds a new task with high priority.                           
 • List tasks:                                                   
                                                                 
    to-do list                                                   
                                                                 
   Displays all tasks.                                           
 • Mark a task as done:                                          
                                                                 
    to-do done 1                                                 
                                                                 
   Marks the first task as completed.                            


                              FILES                              

 • todo.txt : Default file where tasks are stored.               


                           ENVIRONMENT                           

 • No specific environment variables are required.               


                              BUGS                               

 • Known issue: The new command currently expects no arguments,  
   which may cause confusion.                                    


                             LICENSE                             

This software is licensed under the MIT License. See the LICENSE 
file for details.                                                


                             AUTHOR                              

Developed by [Your Name] - [Your Email]                          
