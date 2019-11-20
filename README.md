## Co. Administrator ##

> ### Description ###
>> Co. Administrator is a web application which enables entrepreneurs with multiple teams to better supervise them while on the field.

> ### Scenario ###
>> You have a small flooring company with a team and you need to know how they are doing without constantly checking on them. You just need to set up you company and for each team a manager will sign up. You assign each manager a project with a duration, deadline and daily deadlines ( if any ).   
>> Ex: A team has an apartment or a house for a couple of days and each day they need to send you a few pictures with a small report (contribution).

### Web Demo ###
- - - -

Login                                                                                          |
:---------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/1.png?raw=true"Login") |

- - - -

> A user can register as a CEO, Manager or Employee

CEO Registration                                                                                    |
:--------------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/2.png?raw=true"Register") |


Manager Registration                                                                                |
:--------------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/3.png?raw=true"Register") |


Employee Registration                                                                               |
:--------------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/4.png?raw=true"Register") |

- - - -

> When registering as a CEO you may choose between different plans:
>> **Start-Up**: Up to 3 Managers, 10 Employees & 10 Projects - **Free**
>> **Expanding**: Up to 5 Managers, 30 Employees & 20 Projects - **99$**
>> **Business**: Up to 15 Managers, 150 Employees & 50 Projects - **199$**	  
>> **Expanding**: Unlimited number of Managers, Employees & Projects - **399$**	  

Payment Page                                   | Stripe Payment 									|
:---------------------------------------------:|:--------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/14.png?raw=true "Payment") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/15.png?raw=true "Stripe") |

- - - -

> After login, registration and/or payment the user is redirected to the home page.

Home                       				                                                     |
:-------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/5.png?raw=true "Home") |

- - - -

> A CEO can:
>> See all the managers    
>> See all the employees    
>> Create projects    
>> Upgrade plan    

> A Manager can:
>> See all the employees    
>> Mark Tasks as completed    

> An Employee can:
>> Contribute to projects    

See all managers                                                                                    |
:--------------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/6.png?raw=true "managers") |


See all employees                                                                                    |
:---------------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/7.png?raw=true "employees") |


See all Projects                                                                                      |
:----------------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/8.png?raw=true "projects") |

- - - -

> Creating a project and contributing to tasks

Project creation                                                                                   |
:-------------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/11.png?raw=true "create") |

See project                                                                                         |
:--------------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/9.png?raw=true "project") |

Task contribution                                                                                     |
:----------------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/web/10.png?raw=true "contribute") |

- - - -

> Useful Gems
>> Devise    
>> CanCanCan    
>> Stripe    
>> CarrierWave    
>> Pry  

### iOS Demo ###
- - - -

> The app starts off with the main view controller; the whole app is built around SWRevealViewController

Main View                                                                                      |
:---------------------------------------------------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Main")      |

> A user can login using the button provided in the bottom of the rear view controller of the SWRevealViewController.
> A login view controller pops up, where the user can enter his/her credentials.
> Core Data was used for data persistence.

Rear View Controller                           | Login									| Logged In |
:---------------------------------------------:|:--------------------------------------------------:|:---------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/2.png?raw=true "Rear") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/3.png?raw=true "Login") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/12.png?raw=true "Logged In") |

> The main view is also updated.
> If the current user is a CEO, then he/she has the option to upgrade the company's plan using Stripe for payments.

Logged In Main View                          | Uprgade									| Plans | Payment |
:---------------------------------------------:|:--------------------------------------------------:|:---------:|:---------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/5.png?raw=true "Rear") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/16.png?raw=true "Upgrade") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/4.png?raw=true "Plans") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/14.png?raw=true "Payment") |

> A CEO or a Manager can see a list of managers or employees as well as their profiles.

Managers                           | Employees									| Profile |
:---------------------------------------------:|:--------------------------------------------------:|:---------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/6.png?raw=true "Managers") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/6.png?raw=true "Employees") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/7.png?raw=true "Profile") |

> The user can also see the current projects and can perform actions on them.

Projects                          | Delete									| Confirm |
:---------------------------------------------:|:--------------------------------------------------:|:---------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Projects") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Delete") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Confirm") |

> When selecting a project, a view controller containing the information about that project pops up.
> We can see table view with two sections one for on going tasks and one for completed tasks.
> A task can be marked as completed by swiping on the cell containg that specific task.

Project Info                          | Mark as completed									| Instant Update |
:---------------------------------------------:|:--------------------------------------------------:|:---------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Projects") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Delete") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Confirm") |

> By selecting a task, a view controller containing the contributions for that task pops up.
> Contributions can either be text, images or both.
> A user can see a picture by tapping or 3D Touching on the image circle.

Task Info                                      | Peek			            						| Pop       |
:---------------------------------------------:|:--------------------------------------------------:|:---------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Projects") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Delete") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Confirm") |

> The user can also make contributions using the text field at the bottom of the screen.

Contribute                                     | Preview	            							| 
:---------------------------------------------:|:--------------------------------------------------:|
![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Projects") | ![picture alt](https://github.com/andrei-blaj/Company-Administrator/blob/master/ss/ios/1.png?raw=true "Delete") |

> Useful Pods
>> Alamofire    
>> AlamofireImage    
>> SwiftyJSON    
>> FontAwesome.swift    
>> PIQKeyboardManagerSwiftry
>> Stripe 