https://www.kaggle.com/datasets/samikshadalvi/lungs-diseases-dataset


| Variable Name      | Class (R) | Description                                                                 |
|--------------------|-----------|-----------------------------------------------------------------------------|
| Age                | numeric   | Age of the patient in years.                                               |
| Gender             | character | Biological sex of the patient. Common values: 'Male', 'Female'.            |
| Smoking Status     | character | Indicates whether the patient has a history of smoking. Values: 'Yes', 'No', or NA. |
| Lung Capacity      | numeric   | Measured lung function to assess disease severity.                         |
| Disease Type       | character | The specific lung condition, like COPD, Bronchitis, or Lung Cancer.        |
| Treatment Type     | character | Type of treatment received: therapy, medication, or surgery.               |
| Hospital Visits    | numeric   | Number of hospital visits for managing the condition.                      |
| Recovery Status    | character | Indicates whether the patient recovered after treatment. Values: 'Yes', 'No'. |



Here is a **detailed breakdown** of each variable in your lung disease dataset:

---

### **Categorical Variables**

#### 1. **Gender**

* Female: 2,477
* Male: 2,423
* Missing: 300

#### 2. **Smoking Status**

* Yes: 2,503
* No: 2,397
* Missing: 300

#### 3. **Disease Type**

* Bronchitis: 1,009
* Asthma: 1,008
* COPD: 1,003
* Pneumonia: 946
* Lung Cancer: 934
* Missing: 300

#### 4. **Treatment Type**

* Medication: 1,655
* Therapy: 1,652
* Surgery: 1,593
* Missing: 300

#### 5. **Recovered**

* Yes: 2,492
* No: 2,408
* Missing: 300

---

### **Numerical Variables**

#### 6. **Age (years)**

* Mean: 54.45
* Standard Deviation: 20.13
* Min: 20
* 25th percentile: 37
* Median: 54
* 75th percentile: 72
* Max: 89
* Missing: 300

#### 7. **Lung Capacity (liters)**

* Mean: 3.50
* Standard Deviation: 1.46
* Min: 1.00
* 25th percentile: 2.22
* Median: 3.48
* 75th percentile: 4.80
* Max: 6.00
* Missing: 300

#### 8. **Hospital Visits**

* Mean: 7.53 visits
* Standard Deviation: 4.00
* Min: 1
* 25th percentile: 4
* Median: 8
* 75th percentile: 11
* Max: 14
* Missing: 300