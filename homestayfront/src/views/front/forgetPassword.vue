<template>
  <div class="forget-password">
    <FrontHeaderBar />
    <div style="display:flex;justify-content:center;padding:60px 20px;">
      <el-card style="width:480px;">
        <template #header><div style="text-align:center;font-size:18px;font-weight:bold;">找回密码</div></template>
        <el-form :model="form" label-width="80px">
          <el-form-item label="用户名">
            <el-input v-model="form.username" placeholder="请输入用户名" />
          </el-form-item>
          <el-form-item label="新密码">
            <el-input v-model="form.password" type="password" placeholder="请输入新密码" show-password />
          </el-form-item>
          <el-form-item label="确认密码">
            <el-input v-model="form.confirmPassword" type="password" placeholder="请再次输入新密码" show-password />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" style="width:100%;" @click="handleSubmit">提交</el-button>
          </el-form-item>
        </el-form>
        <div style="text-align:center;">
          <el-button link type="primary" @click="$router.push('/login')">返回登录</el-button>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script setup lang="ts">
import FrontHeaderBar from '@/components/front/FrontHeaderBar.vue'
import { reactive } from 'vue'
import { ElMessage } from 'element-plus'
const form = reactive({ username: '', password: '', confirmPassword: '' })
const handleSubmit = () => {
  if (!form.username || !form.password) return ElMessage.warning('请填写完整信息')
  if (form.password !== form.confirmPassword) return ElMessage.warning('两次密码不一致')
  ElMessage.success('密码重置成功，请重新登录')
}
</script>
