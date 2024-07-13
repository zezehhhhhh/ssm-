// pages/student/myCourse/myCourse.js
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
    colorArrays: ["#85B8CF", "#90C652", "#D8AA5A", "#FC9F9D", "#0A9A84", "#61BC69", "#12AEF3", "#E29AAD"],
    courseList: [{
      "id": 0,
      "name": "",
      "teacher": "",
      'day': "",
      'time': ""
    }],
    recordList: null,
    tkId: 0,
    deleteId : 0
  },

  /**
   * 组件的方法列表
   */
  methods: {
    showCardView: function(e) {
      let num = e.currentTarget.dataset.index;
      this.setData({
        deleteId: this.data.courseList[num].id
      })
      this.dialog = this.selectComponent("#dialog");
      this.tkdialog = this.selectComponent("#tkdialog");
      const data = this.data;
      const dialogContent = [{
          label: '课程编号',
          value: data.courseList[num].id
        },
        {
          label: '课程名称',
          value: data.courseList[num].name
        },
        {
          label: '教师',
          value: data.courseList[num].teacher
        }
      ];
      this.setData({
        dialogContent: dialogContent
      })
      this.dialog.show();

      console.log(num);
    },
    // 点击了弹出框的取消
    handleCancelDialog() {
      this.dialog.hide();
    },
    // 点击了弹出框的确认
    handleConfirmDialog() {
      this.dialog.hide();
      this.tkdialog.show();
    },
    handleCancelDialog2() {
      this.tkdialog.hide();
    },
    // 点击了弹出框的确认
    handleConfirmDialog2() {
      wx.request({
        url: app.globalData.url + '/course/delCourseWechat' + "?id=" + this.data.deleteId,
        success:(res)=>{
          var resData = res.data;
          console.log("成功")
          if (resData) {
            this.tkdialog.hide();
            wx.hideLoading();
            this.getCourseList();
            wx.showToast({
              title: '删除成功',
              icon: 'none',
              duration: 2000
            });
          } else {
            wx.hideLoading();
            wx.showToast({
              title: '删除失败',
              icon: 'none',
              duration: 2000
            });
          }
        },
        fail: function() {
          wx.hideLoading();
          wx.showToast({
            title: '删除失败',
            icon: 'none',
            duration: 2000
          });
        }
      })
    },
    getCourseList() {
      let that = this;
      wx.request({
        url: app.globalData.url + '/course/getAllCourseWechat',
        method: 'POST',
        header: {
          'content-type': 'application/x-www-form-urlencoded'
        },
        success(res) {
          console.log(res.data);
          that.setData({
            courseList: res.data,
          });
          console.log(that.data.courseList)
          // that.dealCourseList(res.data);
        },
        fail(e) {
          console.log(e);
        }
      });
    },
    dealCourseList(data) {
      let cList = [];
      let rList = data;
        for (let j = 0; j < timeObj.length; j++) {
          let obj = {};
          obj.id = rList[j].id;
          obj.name = rList[j].name;
          obj.day = rList[j].day;
          obj.teacher = rList[j].teacher;
          obj.time = rList[j].time;
          cList.push(obj);
        }
      
      console.log(cList);
      this.setData({
        courseList: cList
      })
    },
    strToJson(str) {
      return JSON.parse(str);
    },
  }
})