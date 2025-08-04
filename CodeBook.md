# Code Book for Human Activity Recognition Tidy Dataset

This code book describes the variables, data, and transformations performed to clean up the Human Activity Recognition Using Smartphones dataset.

## Original Data Source

The original data comes from experiments carried out with a group of 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a Samsung Galaxy S II smartphone on their waist.

**Original Dataset:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Transformations

The following transformations were applied to create the tidy dataset:

1. **Merged** training and test datasets
2. **Extracted** only measurements on mean and standard deviation (66 variables)
3. **Replaced** activity codes with descriptive activity names
4. **Renamed** variables with descriptive names
5. **Created** a summary dataset with averages for each subject-activity combination

## Variables in the Tidy Dataset

The final tidy dataset contains 180 observations and 68 variables:

### Identifier Variables

- **subject**: Integer (1-30) - Identifies the volunteer who performed the activity
- **activity**: Factor with 6 levels - The activity performed:
  - WALKING
  - WALKING_UPSTAIRS  
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

### Measurement Variables

All measurement variables are numeric values representing the **average** of the original measurements for each subject-activity combination. Values are normalized and bounded within [-1,1].

The measurement variables follow this naming convention:
- **Time** or **Frequency**: Domain of the signal
- **Body** or **Gravity**: Source of acceleration signal
- **Accelerometer** or **Gyroscope**: Sensor type
- **Jerk**: Jerk signals (derived from acceleration and angular velocity)
- **Magnitude**: Magnitude of three-dimensional signals
- **Mean** or **StandardDeviation**: Statistical measure
- **X**, **Y**, **Z**: Axis direction (for 3-axial signals)

#### Time Domain Signals (33 variables)

**Body Accelerometer:**
- TimeBodyAccelerometerMeanX
- TimeBodyAccelerometerMeanY  
- TimeBodyAccelerometerMeanZ
- TimeBodyAccelerometerStandardDeviationX
- TimeBodyAccelerometerStandardDeviationY
- TimeBodyAccelerometerStandardDeviationZ

**Gravity Accelerometer:**
- TimeGravityAccelerometerMeanX
- TimeGravityAccelerometerMeanY
- TimeGravityAccelerometerMeanZ
- TimeGravityAccelerometerStandardDeviationX
- TimeGravityAccelerometerStandardDeviationY
- TimeGravityAccelerometerStandardDeviationZ

**Body Accelerometer Jerk:**
- TimeBodyAccelerometerJerkMeanX
- TimeBodyAccelerometerJerkMeanY
- TimeBodyAccelerometerJerkMeanZ
- TimeBodyAccelerometerJerkStandardDeviationX
- TimeBodyAccelerometerJerkStandardDeviationY
- TimeBodyAccelerometerJerkStandardDeviationZ

**Body Gyroscope:**
- TimeBodyGyroscopeMeanX
- TimeBodyGyroscopeMeanY
- TimeBodyGyroscopeMeanZ
- TimeBodyGyroscopeStandardDeviationX
- TimeBodyGyroscopeStandardDeviationY
- TimeBodyGyroscopeStandardDeviationZ

**Body Gyroscope Jerk:**
- TimeBodyGyroscopeJerkMeanX
- TimeBodyGyroscopeJerkMeanY
- TimeBodyGyroscopeJerkMeanZ
- TimeBodyGyroscopeJerkStandardDeviationX
- TimeBodyGyroscopeJerkStandardDeviationY
- TimeBodyGyroscopeJerkStandardDeviationZ

**Magnitudes:**
- TimeBodyAccelerometerMagnitudeMean
- TimeBodyAccelerometerMagnitudeStandardDeviation
- TimeGravityAccelerometerMagnitudeMean
- TimeGravityAccelerometerMagnitudeStandardDeviation
- TimeBodyAccelerometerJerkMagnitudeMean
- TimeBodyAccelerometerJerkMagnitudeStandardDeviation
- TimeBodyGyroscopeMagnitudeMean
- TimeBodyGyroscopeMagnitudeStandardDeviation
- TimeBodyGyroscopeJerkMagnitudeMean
- TimeBodyGyroscopeJerkMagnitudeStandardDeviation

#### Frequency Domain Signals (33 variables)

**Body Accelerometer:**
- FrequencyBodyAccelerometerMeanX
- FrequencyBodyAccelerometerMeanY
- FrequencyBodyAccelerometerMeanZ
- FrequencyBodyAccelerometerStandardDeviationX
- FrequencyBodyAccelerometerStandardDeviationY
- FrequencyBodyAccelerometerStandardDeviationZ

**Body Accelerometer Jerk:**
- FrequencyBodyAccelerometerJerkMeanX
- FrequencyBodyAccelerometerJerkMeanY
- FrequencyBodyAccelerometerJerkMeanZ
- FrequencyBodyAccelerometerJerkStandardDeviationX
- FrequencyBodyAccelerometerJerkStandardDeviationY
- FrequencyBodyAccelerometerJerkStandardDeviationZ

**Body Gyroscope:**
- FrequencyBodyGyroscopeMeanX
- FrequencyBodyGyroscopeMeanY
- FrequencyBodyGyroscopeMeanZ
- FrequencyBodyGyroscopeStandardDeviationX
- FrequencyBodyGyroscopeStandardDeviationY
- FrequencyBodyGyroscopeStandardDeviationZ

**Magnitudes:**
- FrequencyBodyAccelerometerMagnitudeMean
- FrequencyBodyAccelerometerMagnitudeStandardDeviation
- FrequencyBodyAccelerometerJerkMagnitudeMean
- FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation
- FrequencyBodyGyroscopeMagnitudeMean
- FrequencyBodyGyroscopeMagnitudeStandardDeviation
- FrequencyBodyGyroscopeJerkMagnitudeMean
- FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation

## Data Processing Steps

1. **Data Collection**: Original data collected from 30 volunteers performing 6 activities
2. **Feature Extraction**: 561 features were calculated from the raw accelerometer and gyroscope signals
3. **Data Splitting**: Data was randomly partitioned into training (70%) and test (30%) sets
4. **Merging**: Training and test sets were recombined for this analysis
5. **Filtering**: Only mean() and std() measurements were retained (66 out of 561 features)
6. **Labeling**: Activity codes were replaced with descriptive names
7. **Variable Naming**: Feature names were expanded to be more descriptive
8. **Summarization**: Data was grouped by subject and activity, with means calculated for each measurement

## Units and Value Ranges

- **subject**: Dimensionless integers from 1 to 30
- **activity**: Categorical variable (factor)
- **Measurement variables**: Normalized values bounded within [-1, 1], dimensionless

The original acceleration signals were measured in standard gravity units 'g', and angular velocity was measured in radians/second. However, all features were normalized and bounded within [-1,1] in the original dataset processing.

## Summary

This tidy dataset provides a clean, summarized version of the original Human Activity Recognition data, with:
- Clear variable names that describe what each measurement represents
- Averaged values for each subject-activity combination
- Consistent formatting and structure suitable for further analysis
