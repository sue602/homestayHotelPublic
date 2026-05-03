<template>
  <div class="h-room-img-view">
    <el-card>
      <template #header>
        <div style="display:flex;justify-content:space-between;align-items:center;">
          <span class="title">房源图片管理</span>
          <el-button type="primary" size="small" @click="handleUpload">上传图片</el-button>
        </div>
      </template>
      <el-table :data="tableData" stripe style="width:100%">
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="roomName" label="所属房源" />
        <el-table-column label="图片预览" width="120">
          <template #default><div class="img-placeholder">图片</div></template>
        </el-table-column>
        <el-table-column label="操作" width="100">
          <template #default>
            <el-button size="small" type="danger">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { reactive } from 'vue'
import { ElMessage } from 'element-plus'
const tableData = reactive([
  { id: 1, roomName: '阳光大床房' },
  { id: 2, roomName: '温馨双人房' },
])
const handleUpload = () => ElMessage.info('上传功能开发中')
</script>

<style scoped>
.img-placeholder {
  width: 60px; height: 40px; background: #f5f5f5;
  display: flex; align-items: center; justify-content: center; font-size: 12px; color: #999;
}
</style>
