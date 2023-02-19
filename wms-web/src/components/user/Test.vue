<template>
  <div class="chart-container">
    <div id="chartPie" style="width:100%; height:550px;"></div>
  </div>
</template>

<script>
export default {
  name: "Typechart",
  data() {
    return {
      chartPie: '',
      typeName: [],
      typeNum: []
    }
  },
  methods: {
    drawPieChart() {
      // 基于准备好的dom，初始化echarts实例
      this.chartPie = this.$echarts.init(document.getElementById("chartPie"));
      this.chartPie.setOption({
        //设置标题,副标题,以及标题位置居中
        title: {
          text: '矿山物资数量统计图',
          x: 'center'
        },
        //具体点击某一项触发的样式内容
        tooltip: {
          trigger: 'item',
          formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        //左上侧分类条形符
        legend: {
          orient: 'vertical',
          left: 'left',
          //通过跨域获取数据给data赋值
          data: []
        },
        //饼状图类型以及数据源
        series: [
          {
            name: "物资分类",
            type: 'pie',
            //radius: '70%',
            //center: ['50%', '60%'],
            //通过跨域获取数据给data赋值
            data: [],
            //设置饼状图扇形区域的样式
            itemStyle: {
              emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              },
            },
            label: {
              formatter: "{a|{a}}{abg|}\n{hr|}\n  {b|{b}:}{c}  {per|{d}%}  ",
              backgroundColor: "",
              borderColor: "",
              borderWidth: 1,
              borderRadius: 4,
              rich: {},
            }
          }
        ]
      });
    },
    //动态获取饼状图的数据
    initData() {
      this.$axios.post(this.$httpUrl+'/goods/listPage',{
      }).then(res=>res.data).then(res=>{
        console.log(res.data);
        var getData = [];
        //先进行赋值
        console.log(res.data.length)
        //for循环赋值
        for(let i=0; i<res.data.length; i++) {
          var obj = new Object();
          obj.name = res.data[i].name;
          obj.value = res.data[i].count;
          getData[i] = obj;
        }
        //然后再给饼状图赋值
        this.chartPie.setOption({
          legend: {
            data: res.data.typeName,
          },
          series:[{
            data: getData,
          }]
        });
      })
    },
    drawCharts() {
      this.drawPieChart();
    },
  },
  //页面一加载就调用方法
  mounted () {
    //先调用这个方法赋值
    this.initData();
    //再调用饼状图方法
    this.drawCharts();
  }

}

</script>

<style scoped>
.chart-container {
  width: 100%;
  float: left;
}
</style>


