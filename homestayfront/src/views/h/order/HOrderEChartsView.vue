<template>
  <div class="h-order-echarts">
    <el-card>
      <template #header><span class="title">财务统计</span></template>
      <div ref="chartRef" style="width:100%;height:400px;"></div>
      <el-table :data="tableData" stripe style="width:100%;margin-top:20px;">
        <el-table-column prop="month" label="月份" width="120" />
        <el-table-column prop="income" label="入账金额">
          <template #default="{ row }">¥{{ row.income }}</template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import * as echarts from 'echarts'

const chartRef = ref<HTMLDivElement>()
const tableData = ref([
  { month: '2024-01', income: 15800 },
  { month: '2024-02', income: 22400 },
  { month: '2024-03', income: 19600 },
  { month: '2024-04', income: 23100 },
])
onMounted(() => {
  if (!chartRef.value) return
  const chart = echarts.init(chartRef.value)
  chart.setOption({
    title: { text: '近期入账金额', left: 'center' },
    xAxis: { type: 'category', data: tableData.value.map(d => d.month) },
    yAxis: { type: 'value' },
    series: [{ data: tableData.value.map(d => d.income), type: 'bar', color: '#409eff' }],
    tooltip: { trigger: 'axis' },
  })
})
</script>
