
<template>
  <div class="index">
    <el-carousel trigger="click" height="700px"  interval="4000">
      <el-carousel-item v-for="item in imgList" :key="item.id">
        <img :src="item" class="image">
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<style>
.index{
  background: #42b983;
  width: 100%;
  height: inherit;
  text-align: center;
}
.image{
  object-fit: fill;
  width: 100%;
  height: 100%;
}

/*.el-carousel__item h3 {*/
/*  color: #475669;*/
/*  font-size: 14px;*/
/*  opacity: 0.75;*/
/*  line-height: 150px;*/
/*  margin: 0;*/
/*}*/

.el-carousel__item:nth-child(2n) {
  background-color: #ffffff;
}

.el-carousel__item:nth-child(2n+1) {
  background-color: #ffffff;
}
</style>

<script>
export default {
  name: 'index',
  data(){
    return {
      drawer: false,
      direction: 'btt',
      imgList: [
        require('../assets/0.png'),
        require('../assets/1.png'),
        require('../assets/2.png'),
        require('../assets/3.png'),
        require('../assets/5.png'),
        require('../assets/6.png')

      ],
    };
  },
}
</script>