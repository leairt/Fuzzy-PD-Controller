# Fuzzy PD Controller

## Project Overview

This project implements a Fuzzy Logic-based Proportional-Derivative (PD) Controller using MATLAB/Simulink environment. The controller employs Mamdani inference system with 49 fuzzy rules to provide intelligent control behavior for dynamic systems.

## System Architecture

### Fuzzy Inference System Specifications

- **Type**: Mamdani fuzzy inference system
- **Inputs**: 2 (Error and Error Derivative)
- **Outputs**: 1 (Control Signal)
- **Number of Rules**: 49
- **Defuzzification Method**: Centroid

### Input Variables

1. **Error (e)**
   - Range: [-1, 1]
   - Membership Functions: 7 triangular functions
   - Linguistic Terms: NB, NM, NS, ZE, PS, PM, PB

2. **Error Derivative (de/dt)**
   - Range: [-1, 1]
   - Membership Functions: 7 triangular functions
   - Linguistic Terms: NB, NM, NS, ZE, PS, PM, PB

### Output Variable

**Control Signal (u)**
- Range: [-1, 1]
- Membership Functions: 7 triangular functions
- Linguistic Terms: NB, NM, NS, ZE, PS, PM, PB

## Implementation Details

### Membership Functions

All input and output variables use triangular membership functions with the following linguistic terms:

- **NB**: Negative Big
- **NM**: Negative Medium  
- **NS**: Negative Small
- **ZE**: Zero
- **PS**: Positive Small
- **PM**: Positive Medium
- **PB**: Positive Big

### Linguistic Variables Table
<div align="center">
  <img width="400px" src="images/lv_table.png" alt="Linguistic Variables Table">
</div>

### Fuzzy Rule Base

The system implements a complete 7×7 rule matrix (49 rules total) that maps combinations of error and error derivative to appropriate control actions. The rule structure follows PD controller logic where:

- Large errors require strong corrective actions
- Error derivatives provide predictive behavior
- Combined evaluation ensures system stability

### Fuzzy Rules Table
<div align="center">
  <img width="400px" src="images/rules_table.png" alt="Fuzzy Rules Table">
</div>

### MATLAB Configuration

#### Input/Output Settings
<div align="center">
  <img width="600px" src="images/matlab_io.png" alt="Input Output Settings MATLAB">
</div>

#### Fuzzy Rules Configuration
<div align="center">
  <img width="600px" src="images/matlab_rules.png" alt="Fuzzy Rules Configuration MATLAB">
</div>


### Inference Methods

- **AND Operation**: Minimum (min)
- **OR Operation**: Maximum (max)
- **Implication**: Minimum (min)
- **Aggregation**: Maximum (max)
- **Defuzzification**: Centroid method

## System Performance

The fuzzy PD controller provides several advantages over conventional PD controllers:

- **Nonlinear Control Action**: Better handling of system nonlinearities
- **Robustness**: Reduced sensitivity to parameter variations
- **Smooth Control**: Continuous output without abrupt changes
- **Expert Knowledge Integration**: Rule-based approach incorporates human expertise

## Implementation Notes

### Design Considerations

1. **Rule Coverage**: Complete rule matrix ensures all input combinations are covered
2. **Membership Overlap**: Triangular functions with appropriate overlap prevent rule gaps
3. **Symmetric Design**: Balanced positive/negative response characteristics
4. **Centroid Defuzzification**: Provides smooth, continuous output

### Performance Tuning

- Adjust membership function parameters for specific applications
- Modify rule consequences for different control strategies
- Scale input/output ranges based on system requirements

## Results and Analysis

### Solution Schemes

#### Part 1 Solution Scheme
<div align="center">
  <img width="600px" src="images/shema_part1.png" alt="Solution Scheme Part 1">
</div>

#### Part 2 Solution Scheme
<div align="center">
  <img width="600px" src="images/shema_part2.png" alt="Solution Scheme Part 2">
</div>

### Signal Results

#### Part 1 Results
<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="images/part1_control.png" alt="Part 1 Control Signal" width="300">
        <br><b>Control Signal</b>
      </td>
      <td align="center">
        <img src="images/part1_output.png" alt="Part 1 Output Signal" width="300">
        <br><b>Output Signal</b>
      </td>
      <td align="center">
        <img src="images/part1_fuzzy_input.png" alt="Part 1 Fuzzy Input" width="300">
        <br><b>Fuzzy Input</b>
      </td>
    </tr>
  </table>
</div>

#### Part 2 Results
<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="images/part2_control.png" alt="Part 2 Control Signal" width="300">
        <br><b>Control Signal</b>
      </td>
      <td align="center">
        <img src="images/part2_output.png" alt="Part 2 Output Signal" width="300">
        <br><b>Output Signal</b>
      </td>
      <td align="center">
        <img src="images/part2_fuzzy_input.png" alt="Part 2 Fuzzy Input" width="300">
        <br><b>Fuzzy Input</b>
      </td>
    </tr>
  </table>
</div>
