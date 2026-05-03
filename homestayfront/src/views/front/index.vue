<template>
  <div class="front-index">
    <FrontHeaderBar />
    <div class="content">
      <el-carousel :interval="4000" type="card" height="350px" style="margin: 20px auto; max-width: 1000px;">
        <el-carousel-item v-for="item in 6" :key="item">
          <div class="carousel-placeholder">{{ item }}</div>
        </el-carousel-item>
      </el-carousel>
      <div class="room-list" style="padding: 20px; max-width: 1200px; margin: 0 auto;">
        <h2>热门房源</h2>
        <el-row :gutter="20">
          <el-col :span="8" v-for="i in 6" :key="i" style="margin-bottom: 20px;">
            <el-card :body-style="{ padding: '0px' }" shadow="hover">
              <div style="padding: 14px;">
                <span>房源示例 {{ i }}</span>
                <div class="bottom">
                  <el-button text class="button" @click="$router.push('/detail/' + i)">查看详情</el-button>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import FrontHeaderBar from '@/components/front/FrontHeaderBar.vue'
</script>

<style scoped>
.carousel-placeholder {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  background: #c0c4cc;
  color: white;
  font-size: 32px;
}
.room-list h2 {
  margin-bottom: 16px;
}
</style>
