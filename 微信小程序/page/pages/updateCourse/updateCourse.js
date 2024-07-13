// pages/updateStudent/updateStudent.js
const app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    id: '',
    collegeList: app.globalData.collegeList,
    professionList: app.globalData.professionList,
    allPList: app.globalData.allPList,
    index1: 0,
    index2: 0,
    userName: '',
    college: '',
    profession: '',
    stuClass: '',
    pwd: '',
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    this.setData({
      id: options.id
    });
    console.log(this.data.stuId);
    this.getOneUser(this.data.stuId);
  },

  
  getIndex(college, profession) {
    let res = [0, 0];
    let cList = this.data.collegeList;
    let apList = this.data.allPList;
    let pList = [];
    for (let i = 0; i < cList.length; i++) {
      if (college === cList[i]) {
        res[0] = i;
        break;
      }
    }
    pList = apList[res[0]];
    for (let j = 0; j < pList.length; j++) {
      if (profession === pList[j]) {
        res[1] = j;
        break;
      }
    }
    console.log(res);
    return res;
  },
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
  bindPickerChange(e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      index1: e.detail.value,
      index2: 0,
      college: this.data.collegeList[e.detail.value],
      professionList: this.data.allPList[e.detail.value],
      profession: this.data.allPList[e.detail.value][0],
    })
  },
  bindPickerChange2(e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      index2: e.detail.value,
      profession: this.data.professionList[e.detail.value]
    })
  },
  resetPwd() {
    let that = this;
    wx.request({
      url: app.globalData.url + '/resetPwd',
      method: 'POST',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      data: {
        'uid': that.data.stuId,
        'pwd': that.data.stuId
      },
      success: function(res) {
        wx.showToast({
          title: '密码重置成功',
          icon: 'none',
          duration: 2000
        });
      },
      fail: function() {
        wx.showToast({
          title: '密码重置失败',
          icon: 'none',
          duration: 2000
        });
      }
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
      title: '正在修改',
    })
    console.log("正在修改");
    let that = this;
    wx.request({
      url: app.globalData.url + '/course/updateCourseWechat',
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
            title: '修改成功',
            icon: 'none',
            duration: 2000
          });
          wx.navigateTo({
            url: '../admin/admin'
          })
        }else{
            wx.hideLoading();
            wx.showToast({
              title: '修改失败',
              icon: 'none',
              duration: 2000
            });
        
      }},
      fail: function() {
        wx.hideLoading();
        wx.showToast({
          title: '修改失败',
          icon: 'none',
          duration: 2000
        });
      }
    })
  
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  }
})