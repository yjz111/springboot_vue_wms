

<template>
  <el-calendar v-model="value">
  </el-calendar>
</template>

<script>
export default {
  data() {
    return {
      value: new Date()
    }
  }
}
</script>

<style scoped>
    .txt-data .time {
        font-size: 1rem;
        margin-right: 0.5rem;
    }
    .split {
        animation: shark 1s step-end infinite;
        vertical-align: center;
        margin-left: 2px;
        margin-right: 2px;
    }
    @keyframes shark {
        0%,
        100% {
            opacity: 1;
        }
        50% {
            opacity: 0;
        }
    }
</style>