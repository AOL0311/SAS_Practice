# SAS 城市考卷設計（包含`PROC GLM`、`PROC FREQ`、`PROC TTEST`和`PROC UNIVARIATE`）

## 問題 1：使用`PROC FREQ`與`EXACT`選項進行頻率分析（10分）

資料集`HealthData`包含變數`SMOK`（吸菸狀態）和`ALCOH`（飲酒狀態）。請使用`PROC FREQ`來計算吸菸和飲酒的頻率分佈，並使用`EXACT`選項進行精確的卡方檢定，檢查吸菸與飲酒狀態之間是否存在顯著的關聯性。

### 解答：

```sas
/* 頻率分析 - 吸菸狀態與飲酒狀態的關聯性，並使用精確卡方檢定 */
PROC FREQ DATA=HealthData;
    TABLES SMOK*ALCOH / CHI2 EXACT;
RUN;

資料集HealthData包含變數AGE（年齡組別）和SBP（收縮壓）。請使用PROC GLM來檢查不同年齡組別對收縮壓（SBP）的影響，並使用MEANS選項進行多重比較。

計算不同年齡組別的SBP的均值，並進行多重比較檢定，確定是否存在顯著差異。

/* 年齡組別與收縮壓的變異數分析 */
PROC GLM DATA=HealthData;
    CLASS AGE;
    MODEL SBP = AGE;
    MEANS AGE / TUKEY;
RUN;


資料集HealthData包含變數SMOK（吸菸狀態）和BMI（身體質量指數）。請使用PROC TTEST檢查吸菸者和非吸菸者在BMI上的差異是否顯著。

/* 吸菸與非吸菸者在BMI上的t檢定 */
PROC TTEST DATA=HealthData;
    CLASS SMOK;
    VAR BMI;
RUN;

資料集HealthData包含變數BMI（身體質量指數）。請使用PROC UNIVARIATE分析BMI的分佈情況，並檢查BMI是否符合常態分佈假設。

/* 分析BMI的分佈情況 */
PROC UNIVARIATE DATA=HealthData;
    VAR BMI;
    HISTOGRAM / NORMAL;
RUN;


資料集HealthData包含變數BMI（身體質量指數）、AGE（年齡）、SBP（收縮壓）和DBP（舒張壓）。請使用PROC GLM進行以下分析：

構建一個多變量回歸模型，以BMI為因變數，AGE、SBP和DBP為自變數。請檢查各自變數的回歸係數及其統計顯著性。

檢查模型的適配度和顯著性，並解釋回歸模型的結果。

/* 多變量回歸分析 */
PROC GLM DATA=HealthData;
    MODEL BMI = AGE SBP DBP;
RUN;


資料集HealthData包含變數SMOK（吸菸狀態）和ALCOH（飲酒狀態）。請使用PROC FREQ計算吸菸和飲酒的頻率分佈，並使用卡方檢定檢查吸菸與飲酒之間的關聯性。

/* 吸菸與飲酒狀態的卡方檢定 */
PROC FREQ DATA=HealthData;
    TABLES SMOK*ALCOH / CHI2;
RUN;


資料集HealthData包含變數BMI（身體質量指數）和SMOK（吸菸狀態）。請使用PROC NPAR1WAY檢查吸菸狀態對BMI的影響。

/* 非參數檢定 - 吸菸狀態與BMI */
PROC NPAR1WAY DATA=HealthData WILCOXON;
    CLASS SMOK;
    VAR BMI;
RUN;


