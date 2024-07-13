// pages/updateStudent/updateStudent.js
const app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    name: '',
    password: '',
    id: '',
    sexy: '',
    major: '',
    grade: '',
    type: ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    this.setData({
      id: options.id
    });
  },

  
  input_id(e) {
    this.setData({
      id: e.detail.value
    })
  },
  input_password(e) {
    this.setData({
      password: e.detail.value
    })
  },
  input_major(e) {
    this.setData({
      major: e.detail.value
    })
  },
  input_name(e) {
    this.setData({
      name: e.detail.value
    })
  },
  input_grade(e) {
    this.setData({
      grade: e.detail.value
    })
  },
  input_sexy(e) {
    this.setData({
      sexy: e.detail.value
    })
  },
  input_type(e) {
    this.setData({
      type: e.detail.value
    })
  },
  submit() {
    if (this.data.id === '') {
      wx.showToast({
        title: '学号不能为空',
        icon: 'none'
      });
      return;
    }
    if (this.data.name === '') {
      wx.showToast({
        title: '姓名不能为空',
        icon: 'none'
      });
      return;
    }
    if (this.data.grade === '') {
      wx.showToast({
        title: '班级不能为空',
        icon: 'none'
      });
      return;
    }
    wx.showLoading({
      title: '正在修改',
    })
    console.log("正在修改" + this.data.id);
    let that = this;
    wx.request({
      url: app.globalData.url + '/user/updateStudentWechat',
      method: 'POST',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      data: {
        'id': that.data.id,
        'name': that.data.name,
        'password': that.data.password,
        'sexy': that.data.sexy,
        'type': that.data.type,
        'major': that.data.major,
        'grade': that.data.grade
      },
      dataType:"json",
      success: function(res) {
        console.log(that.data),
        console.log("addStudent:", res.data);
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
          console.log('addStudentfail');
        }
      },
      fail: function() {
        wx.hideLoading();
        wx.showToast({
          title: '修改失败',
          icon: 'none',
          duration: 2000
        });
        console.log('addStudentfail');
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