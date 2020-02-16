# UCAS 数字电路实验课 代码
> 2019年秋季学期 计算机科学与技术专业用

此仓库为 ceba 在 2019 年秋季学期数字电路实验课上的代码存档，这门课主要内容就是 Verilog 硬件描述语言的使用和基本的数字电路设计，为下一学期的计算机组成原理课程打基础。共包含 8 个实验：
* [project_add](project_add/)：加法器
* [project_count](project_count/)：计数器
* [project_state_machine](project_state_machine/)：状态机
* [project_FIFO](project_FIFO/)：FIFO
* [project_DMA](project_DMA/)：DMA，[文档](project_DMA/docs/DMA项目文档.md)
* [project_run_led](project_run_led/)：跑马灯（上板）
* [project_watch](project_watch/)：电子表（上板）
* [project_ALU](project_ALU/)：ALU

实验基本只包含 Verilog 源文件，DMA 实验还包括了项目文档。

实验基本在 Xilinx Vivado 平台上进行，跑马灯和电子表两个实验在开发板进行了验证，其余实验只进行了行为仿真。

现在回过头看，之前写的 Verilog 代码相当的丑。在 DMA 实验之前的代码几乎都是程序设计的思路，从 DMA 开始才稍微有些电路设计的风格……

## Licence
以 MIT 许可证发布，请勿用于不良行为。