<template>
  <div class="h-room-view">
    <el-card>
      <template #header>
        <div style="display:flex;justify-content:space-between;align-items:center;">
          <span class="title">房源管理</span>
          <el-button type="primary" size="small" @click="dialogVisible=true">新增房源</el-button>
        </div>
      </template>
      <el-table :data="tableData" stripe style="width:100%">
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="name" label="房源名称" />
        <el-table-column prop="price" label="价格/晚" width="100">
          <template #default="{ row }">¥{{ row.price }}</template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.status==='上架'?'success':'info'">{{ row.status }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200">
          <template #default>
            <el-button size="small" @click="dialogVisible=true">编辑</el-button>
            <el-button size="small" type="danger">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <el-dialog v-model="dialogVisible" title="房源信息" width="500px">
      <el-form :model="form" label-width="80px">
        <el-form-item label="房源名称"><el-input v-model="form.name" /></el-form-item>
        <el-form-item label="价格"><el-input v-model="form.price" /></el-form-item>
        <el-form-item label="状态">
          <el-select v-model="form.status" style="width:100%">
            <el-option label="上架" value="上架" />
            <el-option label="下架" value="下架" />
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible=false">取消</el-button>
        <el-button type="primary" @click="dialogVisible=false">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
const dialogVisible = ref(false)
const form = reactive({ name: '', price: '', status: '上架' })
const tableData = reactive([
  { id: 1, name: '阳光大床房', price: 299, status: '上架' },
  { id: 2, name: '温馨双人房', price: 399, status: '上架' },
])
</script>
