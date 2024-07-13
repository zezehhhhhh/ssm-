// pages/admin/mKind/mKind.js
const app = getApp();
Component({
  /**
   * 组件的属性列表
   */
  properties: {

  },

  /**
   * 组件的初始数据
   */
  data: {
    collegeList: app.globalData.collegeList,
    professionList: app.globalData.professionList,
    allPList: app.globalData.allPList,
    kindList: ['必修课', '限选课'],
    index1: 0,
    index2: 0,
    index3: 0,
    cnum: '',
    profession: app.globalData.professionList[0],
    kind: '必修课'
  },

  /**
   * 组件的方法列表
   */
  methods: {
    input_id(e) {
      this.setData({
        id: e.detail.value
      })
    },
    
    input_name(e) {
      this.setData({
        name: e.detail.value
      })
    },
    
    input_day(e) {
      this.setData({
        day: e.detail.value
      })
    },
    
    input_time(e) {
      this.setData({
        time: e.detail.value
      })
    },
    
    input_teacher(e) {
      this.setData({
        teacher: e.detail.value
      })
    },
    submit() {
      if (this.data.id === '') {
        wx.showToast({
          title: '课程号不能为空',
          icon: 'none'
        });
        return;
      }
      wx.showLoading({
        title: '正在添加',
      })
      console.log("正在添加");
      let that = this;
      wx.request({
        url: app.globalData.url + '/course/addCourseWechat',
        method: 'POST',
        header: {
          'content-type': 'application/x-www-form-urlencoded'
        },
        data: {
          'id': that.data.id,
          'name': that.data.name,
          'teacher': that.data.teacher,
          'day': that.data.day,
          'time': that.data.time
        },
        success: function(res) {
          var resData = res.data;
          if (resData) {
            wx.hideLoading();
            wx.showToast({
              title: '添加成功',
              icon: 'none',
              duration: 2000
            });
            wx.navigateTo({
              url: '../admin/admin'
            })
          }else{
              wx.hideLoading();
              wx.showToast({
                title: '添加失败',
                icon: 'none',
                duration: 2000
              });
          
        }},
        fail: function() {
          wx.hideLoading();
          wx.showToast({
            title: '添加失败',
            icon: 'none',
            duration: 2000
          });
        }
      })
    }
  }
})