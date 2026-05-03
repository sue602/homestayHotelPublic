<template>
  <div class="user-info">
    <FrontHeaderBar />
    <div style="padding:20px;max-width:800px;margin:0 auto;">
      <h2>个人信息</h2>
      <el-form :model="form" label-width="80px" style="margin-top:20px;">
        <el-form-item label="用户名">
          <el-input v-model="form.username" disabled />
        </el-form-item>
        <el-form-item label="手机号">
          <el-input v-model="form.phone" />
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="form.gender">
            <el-radio label="男" />
            <el-radio label="女" />
            <el-radio label="保密" />
          </el-radio-group>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSave">保存修改</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script setup lang="ts">
import FrontHeaderBar from '@/components/front/FrontHeaderBar.vue'
import { reactive } from 'vue'
import { ElMessage } from 'element-plus'
const form = reactive({
  username: 'user',
  phone: '13800000000',
  gender: '男',
})
const handleSave = () => {
  ElMessage.success('保存成功')
}
</script>
