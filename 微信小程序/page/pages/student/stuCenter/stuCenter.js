// pages/student/stuCenter/stuCenter.js
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
    stuInfo: [],
    user:{
      name: '',
      password: '',
      id: '',
      sexy: '',
      major: '',
      grade: '',
      type: ''
    }
  },

  /**
   * 组件的方法列表
   */
  methods: {
    getuser() {
      this.setData({
        user: app.globalData.user
      });
      console.log(this.user);
    },
    resetpwd() {
      wx.navigateTo({
        url: '../resetPwd/resetPwd',
      })
    },
    exit() {
      app.globalData.nowUser = null;
      wx.reLaunch({
        url: '../index/index',
      })
    }
  }
  
}
)

