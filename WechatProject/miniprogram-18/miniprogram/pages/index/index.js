// pages/detail/detail.js
const db = wx.cloud.database({ env: "sh1046601146-t1yiq" });
const books = db.collection("books");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    imgUrls: [
      'https://imagev2.xmcdn.com/group76/M00/29/78/wKgO1F5q8rejE3p1AADqg8LTt7c035.jpg!strip=1&quality=7&magick=jpg&op_type=5&upload_type=cover&name=large_pop&device_type=ios',
      'https://imagev2.xmcdn.com/group75/M02/B5/E3/wKgO3V5TZRbwfKyzAAIui95-suw896.jpg!strip=1&quality=7&magick=jpg&op_type=5&upload_type=cover&name=large_pop&device_type=ios',
      'https://imagev2.xmcdn.com/group73/M02/7D/5F/wKgO215gaG-Q_SV5AAIT2RISGP4747.jpg!strip=1&quality=7&magick=jpg&op_type=5&upload_type=cover&name=large_pop&device_type=ios'
    ],
    books:[],
   
  },
  
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    books.get().then(res => {
      console.log(res.data)
      this.setData({
        books: res.data
      })
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})