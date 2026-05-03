<template>
  <div class="h-user-view">
    <el-card>
      <template #header><span class="title">前台用户管理</span></template>
      <el-table :data="tableData" stripe style="width:100%">
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="username" label="用户名" />
        <el-table-column prop="phone" label="手机号" width="140" />
        <el-table-column prop="gender" label="性别" width="80" />
        <el-table-column label="操作" width="160">
          <template #default>
            <el-button size="small" type="primary">编辑</el-button>
            <el-button size="small" type="danger">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { reactive } from 'vue'
const tableData = reactive([
  { id: 1, username: '张三', phone: '13800000001', gender: '男' },
  { id: 2, username: '李四', phone: '13800000002', gender: '女' },
])
</script>
