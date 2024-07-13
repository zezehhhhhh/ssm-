//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    name: '',
    password: '',
    id: '',
    sexy: '',
    major: '',
    grade: '',
    type: '',
    saveMassage:""
  },
  //事件处理函数
  input_name(e) {
    this.setData({
      name: e.detail.value
    })
  },
  input_password(e) {
    this.setData({
      password: e.detail.value
    })
  },
  login: function() {
    if (this.data.name === '') {
      wx.showToast({
        title: '请输入账号',
        icon: 'none'
      });
      return;
    }
    if (this.data.password === '') {
      wx.showToast({
        title: '请输入密码',
        icon: 'none'
      });
      return;
    }
    wx.showLoading({
      title: '登录中',
    });
    let that = this;
    wx.request({
      url: app.globalData.url + '/user/loginWechat',
      method: 'POST',
      header: {
        'content-type': 'application/x-www-form-urlencoded'
      },
      dataType:'json',
      data: {
        'name': that.data.name,
        'password': that.data.password
      },
      success: function(res) {
        var resData = res.data.type;
        var app = getApp();
        app.globalData.hasLogin = true;
        app.globalData.user=res.data;
        console.log(app.globalData.user);
        if (resData == 0 || resData == 1) {
          wx.hideLoading();
          wx.reLaunch({
            url: '../admin/admin'
          });
          wx.showToast({
            title: '登录成功',
            icon: 'none',
            duration: 2000
          });
        } else if (resData === 2) {
          wx.hideLoading();
          wx.reLaunch({
            url: '../student/student'
          });
          wx.showToast({
            title: '登录成功',
            icon: 'none',
            duration: 2000
          });
        }else{
          wx.hideLoading();
          wx.showToast({
          title: '登录失败',
          icon: 'none',
          duration: 2000
           });
        }
      },
      fail: function() {
        wx.hideLoading();
        wx.showToast({
          title: '登录失败',
          icon: 'none',
          duration: 2000
        });
      }
    })
  },

  onLoad: function() {
    if (app.globalData.userInfo) {
      console.log(app.globalData.userInfo);
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse) {
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        console.log(app.globalData.userInfo);
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          app.globalData.userInfo = res.userInfo
          console.log(app.globalData.userInfo);
          this.setData({
            userInfo: res.userInfo,
            hasUserInfo: true
          })
        }
      })
    }
  },
  getUserInfo: function(e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    console.log(app.globalData.userInfo);
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  }
})