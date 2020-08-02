layui.config({
    base : "js/"
}).use(['form','layer','jquery','laypage','table','laytpl'],function(){
    var form = layui.form,table = layui.table;
    layer = parent.layer === undefined ? layui.layer : parent.layer,
        laypage = layui.laypage,
        $ = layui.jquery;
    //数据表格
    table.render({
        id:'repairsList',
        elem: '#repairsList'
        ,url: ctx+'/repairs/getRepairsList' //数据接口
        ,cellMinWidth: 80
        ,limit:10//每页默认数
        ,limits:[10,20,30,40]
        ,cols: [[ //表头
            {type:'checkbox'}
            ,{field:'id', title: 'ID', sort: true}
            ,{field:'content', title: '详情'}
            ,{field:'address', title: '地址'}
            ,{field:'formType', title: '类型',templet : '#formTypeTpl'}
            ,{field:'status', title: '状态', templet : '#statusTpl'}
            ,{field:'linkman', title: '联系人'}
            ,{field:'tel', title: '联系电话'}
            ,{field:'linkUrl', title: '图片',templet:'<div><img src="'+ctx+'/file/showPic?fileName={{ d.linkUrl}}"></div>'}
            ,{field:'replyContent', title: '回复'}
            ,{field:'createDate', title: '创建时间',templet: '<div>{{ formatTime(d.createDate,"yyyy-MM-dd hh:mm:ss")}}</div>'}
            ,{field:'modifyDate', title: '更新时间',templet: '<div>{{ formatTime(d.modifyDate,"yyyy-MM-dd hh:mm:ss")}}</div>'}
            ,{title: '操作',toolbar: '#barEdit'}
        ]]
        ,page: true //开启分页
    });
    //监听工具条
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            if(data.status==1){
                layer.msg("报修单已处理，无法删除！",{icon: 5});
                return;
             }

            layer.confirm('真的删除行么?', function(index){
                $.ajax({
                    url:ctx+'/repairs/deleteById/'+data.id,
                    type : "get",
                    success : function(d){
                        if(d.code==0){
                            table.reload('repairsList', {})
                        }else{
                            layer.msg("权限不足，联系超管！",{icon: 5});
                        }
                    }
                })
                layer.close(index);
            });
        } else if(obj.event === 'edit'){
            if(data.status==1){
                layer.msg("报修单已处理，无法编辑！",{icon: 5});
                return;
            }
            layer.open({
                type: 2,
                title:"编辑报修单",
                area: ['500px', '660px'],
                content:ctx+"/repairs/updateRepair/"+data.id //这里content是一个普通的String
            })
        }
    });

    //添加报修单
    $(".carouselAdd_btn").click(function(){
        layer.open({
            type: 2,
            title:"添加报修单",
            area: ['500px', '600px'],
            content:ctx+"/repairs/repairAdd", //这里content是一个普通的String
        })
    })

})

//格式化时间
function formatTime(datetime,fmt){
    if(datetime==null||datetime==0){
        return "";
    }
    if (parseInt(datetime)==datetime) {
        if (datetime.length==10) {
            datetime=parseInt(datetime)*1000;
        } else if(datetime.length==13) {
            datetime=parseInt(datetime);
        }
    }
    datetime=new Date(datetime);
    var o = {
        "M+" : datetime.getMonth()+1,                 //月份
        "d+" : datetime.getDate(),                    //日
        "h+" : datetime.getHours(),                   //小时
        "m+" : datetime.getMinutes(),                 //分
        "s+" : datetime.getSeconds(),                 //秒
        "q+" : Math.floor((datetime.getMonth()+3)/3), //季度
        "S"  : datetime.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (datetime.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
}
