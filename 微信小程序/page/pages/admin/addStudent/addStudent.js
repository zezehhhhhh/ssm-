// pages/admin/addStudent/addStudent.js
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
    name: '',
    password: '',
    id: '',
    sexy: '',
    major: '',
    grade: '',
    type: ''
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
        title: '正在添加',
      })
      console.log("正在添加" + this.data.id);
      let that = this;
      wx.request({
        url: app.globalData.url + '/user/addStudentWechat',
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
            console.log('addStudentfail');
          }
        },
        fail: function() {
          wx.hideLoading();
          wx.showToast({
            title: '添加失败',
            icon: 'none',
            duration: 2000
          });
          console.log('addStudentfail');
        }
      })
    }
  }
})