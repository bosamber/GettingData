 TIDYDATA
========================================================

# Introduction
This is a data dictionary (or: code book) for a data set created for the Course 
Project in Getting and Cleaning Data. Below is the list of variables in this 
final data set with a description and some summary statistics. More information 
on how this data set was created (and motivation for variable names) can be found
in the README.md in this github 
repository.  



```
##     1 activity_label                                                         
##       Activity performed by participant during the experiment 
##       class:  character  
##        values: 
##            LAYING 
##            SITTING 
##            STANDING 
##            WALKING 
##            WALKING_DOWNSTAIRS 
##            WALKING_UPSTAIRS
```

```
##     2 subject_id                                                             
##       Unique identifier for participant in experiment 
##       class:  integer    
##        range from:  1  to:  30 
## 
```

```
##     3 timedomain_body_accelerator_mean_x                                     
##       Mean of the linear acceleration of the body along the X axis (time domain) 
##       class:  numeric    min:  0.221598   max:  0.301461 
##  
##     4 timedomain_body_accelerator_mean_y                                     
##       Mean of the linear acceleration of the body along the Y axis (time domain) 
##       class:  numeric    min:  -0.040514   max:  -0.001308 
##  
##     5 timedomain_body_accelerator_mean_z                                     
##       Mean of the linear acceleration of the body along the Z axis (time domain) 
##       class:  numeric    min:  -0.152514   max:  -0.075378 
##  
##     6 timedomain_body_accelerator_standarddeviation_x                        
##       Standard deviation of the linear acceleration of the body along the X axis (time domain) 
##       class:  numeric    min:  -0.996069   max:  0.626917 
##  
##     7 timedomain_body_accelerator_standarddeviation_y                        
##       Standard deviation of the linear acceleration of the body along the Y axis (time domain) 
##       class:  numeric    min:  -0.990241   max:  0.616937 
##  
##     8 timedomain_body_accelerator_standarddeviation_z                        
##       Standard deviation of the linear acceleration of the body along the Z axis (time domain) 
##       class:  numeric    min:  -0.987659   max:  0.609018 
##  
##     9 timedomaingravity_accelerator_mean_x                                   
##       Mean of the linear acceleration by gravity along the X axis (time domain) 
##       class:  numeric    min:  -0.680043   max:  0.974509 
##  
##    10 timedomaingravity_accelerator_mean_y                                   
##       Mean of the linear acceleration by gravity along the Y axis (time domain) 
##       class:  numeric    min:  -0.479895   max:  0.956594 
##  
##    11 timedomaingravity_accelerator_mean_z                                   
##       Mean of the linear acceleration by gravity along the Z axis (time domain) 
##       class:  numeric    min:  -0.495089   max:  0.957873 
##  
##    12 timedomaingravity_accelerator_standarddeviation_x                      
##       Standard deviation of the linear acceleration by gravity along the X axis (time domain) 
##       class:  numeric    min:  -0.996764   max:  -0.829555 
##  
##    13 timedomaingravity_accelerator_standarddeviation_y                      
##       Standard deviation of the linear acceleration by gravity along the Y axis (time domain) 
##       class:  numeric    min:  -0.994248   max:  -0.643578 
##  
##    14 timedomaingravity_accelerator_standarddeviation_z                      
##       Standard deviation of the linear acceleration by gravity along the Z axis (time domain) 
##       class:  numeric    min:  -0.990957   max:  -0.610161 
##  
##    15 timedomain_body_accelerator_jerk_mean_x                                
##       Mean of the linear acceleration of the body along the X axis (jerk part) (time domain) 
##       class:  numeric    min:  0.042688   max:  0.130193 
##  
##    16 timedomain_body_accelerator_jerk_mean_y                                
##       Mean of the linear acceleration of the body along the Y axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.038687   max:  0.056819 
##  
##    17 timedomain_body_accelerator_jerk_mean_z                                
##       Mean of the linear acceleration of the body along the Z axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.067458   max:  0.038053 
##  
##    18 timedomain_body_accelerator_jerk_standarddeviation_x                   
##       Standard deviation of the linear acceleration of the body along the X axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.994605   max:  0.544273 
##  
##    19 timedomain_body_accelerator_jerk_standarddeviation_y                   
##       Standard deviation of the linear acceleration of the body along the Y axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.989514   max:  0.355307 
##  
##    20 timedomain_body_accelerator_jerk_standarddeviation_z                   
##       Standard deviation of the linear acceleration of the body along the Z axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.993288   max:  0.031016 
##  
##    21 timedomain_body_gyroscope_mean_x                                       
##       Mean of the angular velocity of the body along the X axis (time domain) 
##       class:  numeric    min:  -0.205775   max:  0.192704 
##  
##    22 timedomain_body_gyroscope_mean_y                                       
##       Mean of the angular velocity of the body along the Y axis (time domain) 
##       class:  numeric    min:  -0.204205   max:  0.027471 
##  
##    23 timedomain_body_gyroscope_mean_z                                       
##       Mean of the angular velocity of the body along the Z axis (time domain) 
##       class:  numeric    min:  -0.072455   max:  0.179102 
##  
##    24 timedomain_body_gyroscope_standarddeviation_x                          
##       Standard deviation of the angular velocity of the body along the X axis (time domain) 
##       class:  numeric    min:  -0.994277   max:  0.267657 
##  
##    25 timedomain_body_gyroscope_standarddeviation_y                          
##       Standard deviation of the angular velocity of the body along the Y axis (time domain) 
##       class:  numeric    min:  -0.99421   max:  0.476519 
##  
##    26 timedomain_body_gyroscope_standarddeviation_z                          
##       Standard deviation of the angular velocity of the body along the Z axis (time domain) 
##       class:  numeric    min:  -0.985538   max:  0.564876 
##  
##    27 timedomain_body_gyroscope_jerk_mean_x                                  
##       Mean of the angular velocity of the body along the X axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.157213   max:  -0.022092 
##  
##    28 timedomain_body_gyroscope_jerk_mean_y                                  
##       Mean of the angular velocity of the body along the Y axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.076809   max:  -0.013202 
##  
##    29 timedomain_body_gyroscope_jerk_mean_z                                  
##       Mean of the angular velocity of the body along the Z axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.0925   max:  -0.006941 
##  
##    30 timedomain_body_gyroscope_jerk_standarddeviation_x                     
##       Standard deviation of the angular velocity of the body along the X axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.996543   max:  0.179149 
##  
##    31 timedomain_body_gyroscope_jerk_standarddeviation_y                     
##       Standard deviation of the angular velocity of the body along the Y axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.997082   max:  0.295946 
##  
##    32 timedomain_body_gyroscope_jerk_standarddeviation_z                     
##       Standard deviation of the angular velocity of the body along the Z axis (jerk part) (time domain) 
##       class:  numeric    min:  -0.995381   max:  0.193206 
##  
##    33 timedomain_body_accelerator_jerk_magnitude_mean                        
##       Mean of the magnitude of the linear acceleration of the body (jerk part) (time domain) 
##       class:  numeric    min:  -0.992815   max:  0.43449 
##  
##    34 timedomain_body_accelerator_jerk_magnitude_standarddeviation           
##       Standard deviation of the magnitude of the linear acceleration of the body (jerk part) (time domain) 
##       class:  numeric    min:  -0.994647   max:  0.450612 
##  
##    35 timedomain_body_gyroscope_magnitude_mean                               
##       Mean of the magnitude of the angular velocity of the body (time domain) 
##       class:  numeric    min:  -0.980741   max:  0.418005 
##  
##    36 timedomain_body_gyroscope_magnitude_standarddeviation                  
##       Standard deviation of the magnitude of the angular velocity of the body (time domain) 
##       class:  numeric    min:  -0.981373   max:  0.299976 
##  
##    37 timedomain_body_gyroscope_jerk_magnitude_mean                          
##       Mean of the magnitude of the angular velocity of the body (jerk part) (time domain) 
##       class:  numeric    min:  -0.997323   max:  0.087582 
##  
##    38 timedomain_body_gyroscope_jerk_magnitude_standarddeviation             
##       Standard deviation of the magnitude of the angular velocity of the body (jerk part) (time domain) 
##       class:  numeric    min:  -0.997666   max:  0.250173 
##  
##    39 frequencydomain_body_accelerator_mean_x                                
##       Mean of the linear acceleration of the body along the X axis (frequency domain) 
##       class:  numeric    min:  -0.99525   max:  0.537012 
##  
##    40 frequencydomain_body_accelerator_mean_y                                
##       Mean of the linear acceleration of the body along the Y axis (frequency domain) 
##       class:  numeric    min:  -0.989034   max:  0.524188 
##  
##    41 frequencydomain_body_accelerator_mean_z                                
##       Mean of the linear acceleration of the body along the Z axis (frequency domain) 
##       class:  numeric    min:  -0.989474   max:  0.280736 
##  
##    42 frequencydomain_body_accelerator_standarddeviation_x                   
##       Standard deviation of the linear acceleration of the body along the X axis (frequency domain) 
##       class:  numeric    min:  -0.996605   max:  0.658507 
##  
##    43 frequencydomain_body_accelerator_standarddeviation_y                   
##       Standard deviation of the linear acceleration of the body along the Y axis (frequency domain) 
##       class:  numeric    min:  -0.99068   max:  0.560191 
##  
##    44 frequencydomain_body_accelerator_standarddeviation_z                   
##       Standard deviation of the linear acceleration of the body along the Z axis (frequency domain) 
##       class:  numeric    min:  -0.987225   max:  0.687124 
##  
##    45 frequencydomain_body_accelerator_jerk_mean_x                           
##       Mean of the linear acceleration of the body along the X axis (jerk part) (frequency domain) 
##       class:  numeric    min:  -0.994631   max:  0.474317 
##  
##    46 frequencydomain_body_accelerator_jerk_mean_y                           
##       Mean of the linear acceleration of the body along the Y axis (jerk part) (frequency domain) 
##       class:  numeric    min:  -0.989399   max:  0.276717 
##  
##    47 frequencydomain_body_accelerator_jerk_mean_z                           
##       Mean of the linear acceleration of the body along the Z axis (jerk part) (frequency domain) 
##       class:  numeric    min:  -0.992018   max:  0.157776 
##  
##    48 frequencydomain_body_accelerator_jerk_standarddeviation_x              
##       Standard deviation of the linear acceleration of the body along the X axis (jerk part) (frequency domain) 
##       class:  numeric    min:  -0.995074   max:  0.476804 
##  
##    49 frequencydomain_body_accelerator_jerk_standarddeviation_y              
##       Standard deviation of the linear acceleration of the body along the Y axis (jerk part) (frequency domain) 
##       class:  numeric    min:  -0.990468   max:  0.349771 
##  
##    50 frequencydomain_body_accelerator_jerk_standarddeviation_z              
##       Standard deviation of the linear acceleration of the body along the Z axis (jerk part) (frequency domain) 
##       class:  numeric    min:  -0.993108   max:  -0.006236 
##  
##    51 frequencydomain_body_gyroscope_mean_x                                  
##       Mean of the angular velocity of the body along the X axis (frequency domain) 
##       class:  numeric    min:  -0.993123   max:  0.474962 
##  
##    52 frequencydomain_body_gyroscope_mean_y                                  
##       Mean of the angular velocity of the body along the Y axis (frequency domain) 
##       class:  numeric    min:  -0.994025   max:  0.328817 
##  
##    53 frequencydomain_body_gyroscope_mean_z                                  
##       Mean of the angular velocity of the body along the Z axis (frequency domain) 
##       class:  numeric    min:  -0.985958   max:  0.492414 
##  
##    54 frequencydomain_body_gyroscope_standarddeviation_x                     
##       Standard deviation of the angular velocity of the body along the X axis (frequency domain) 
##       class:  numeric    min:  -0.994652   max:  0.196613 
##  
##    55 frequencydomain_body_gyroscope_standarddeviation_y                     
##       Standard deviation of the angular velocity of the body along the Y axis (frequency domain) 
##       class:  numeric    min:  -0.994353   max:  0.646234 
##  
##    56 frequencydomain_body_gyroscope_standarddeviation_z                     
##       Standard deviation of the angular velocity of the body along the Z axis (frequency domain) 
##       class:  numeric    min:  -0.986725   max:  0.522454 
##  
##    57 frequencydomain_body_accelerator_magnitude_mean                        
##       Mean of the magnitude of the linear acceleration of the body (frequency domain) 
##       class:  numeric    min:  -0.986801   max:  0.586638 
##  
##    58 frequencydomain_body_accelerator_magnitude_standarddeviation           
##       Standard deviation of the magnitude of the linear acceleration of the body (frequency domain) 
##       class:  numeric    min:  -0.987648   max:  0.178685 
##  
##    59 frequencydomain_body_accelerator_jerk_magnitude_mean                   
##       Mean of the magnitude of the linear acceleration of the body (jerk part) (frequency domain) 
##       class:  numeric    min:  -0.993998   max:  0.538405 
##  
##    60 frequencydomain_body_accelerator_jerk_magnitude_standarddeviation      
##       Standard deviation of the magnitude of the linear acceleration of the body (jerk part) (frequency domain) 
##       class:  numeric    min:  -0.994367   max:  0.316346 
##  
##    61 frequencydomain_body_gyroscope_magnitude_mean                          
##       Mean of the magnitude of the angular velocity of the body (frequency domain) 
##       class:  numeric    min:  -0.986535   max:  0.20398 
##  
##    62 frequencydomain_body_gyroscope_magnitude_standarddeviation             
##       Standard deviation of the magnitude of the angular velocity of the body (frequency domain) 
##       class:  numeric    min:  -0.981469   max:  0.23666 
##  
##    63 frequencydomain_body_gyroscope_jerk_magnitude_mean                     
##       Mean of the magnitude of the angular velocity of the body (jerk part) (frequency domain) 
##       class:  numeric    min:  -0.997617   max:  0.146619 
##  
##    64 frequencydomain_body_gyroscope_jerk_magnitude_standarddeviation        
##       Standard deviation of the magnitude of the angular velocity of the body (jerk part) (frequency domain) 
##       class:  numeric    min:  -0.997585   max:  0.287835 
## 
```


