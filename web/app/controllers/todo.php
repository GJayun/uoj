<?php
$blogs = DB::selectAll("select blogs.id, title, poster, post_time from important_blogs, blogs where is_hidden = 0 and important_blogs.blog_id = blogs.id order by level desc, important_blogs.blog_id desc limit 5");
?>
<?php echoUOJPageHeader(UOJConfig::$data['profile']['oj-name-short'], array("jayun_type" => "todo")) ?>
<div class="ui segment">
    <div id="calendar">
        <div>
            <button onClick="shang()" class="ui button mon">上个月</button>
            <div id="month"></div>
            <button onClick="next()" id="nav" class="ui button mon">下个月</button>
        </div>
        <div>
            <div class="evrday">日</div>
            <div class="evrday">一</div>
            <div class="evrday">二</div>
            <div class="evrday">三</div>
            <div class="evrday">四</div>
            <div class="evrday">五</div>
            <div class="evrday">六</div>
        </div>

        <div id="day"></div>
    </div>
</div>
<script>
    var today=new Date();//获取当前时间
    var year=today.getFullYear();//获取当前的年份
    var month=today.getMonth()+1;//获取当前月
    var day=today.getDate();//获取当前月
    var allday=0;
    function showmonth(){
        var year_month=year+"年"+month+"月";
        document.getElementById("month").innerHTML=year_month;//显示当前的年月日
    }

    function count(){
        if(month!=2)
        {
            if(month==4||month==6||month==9||month==11)//判断是否是相同天数的几个月，二月除外
                allday=30;
            else
                allday=31;
        }
        else
        {
            if((year%4==0&&year%100!=0)||(year%400==0))//判断是否是闰年，进行相应的改变
                allday=29;
            else
                allday=28;}
    }
    //显示相应月份的天数
    function showday(){
        showmonth()
        count();
        var fistdate=new Date(year,month-1,1);
        var xinqi=fistdate.getDay();
        var daterow=document.getElementById("day");
        for(var i=0;i<xinqi;i++)//循环输出天数
        {
            var dayElement=document.createElement("div");
            dayElement.className="evrday";
            daterow.appendChild(dayElement);
        }

        for(var j=1;j<=allday;j++)
        {
            var dayElement=document.createElement("div");
            dayElement.innerHTML=j;
            dayElement.className="evrday";
            if(j==day && month === new Date().getMonth() + 1)//当前日，标红
                dayElement.style.color="red";
            daterow.appendChild(dayElement);
        }
    }
    //点击下个月
    function next(){
        document.getElementById('day').innerHTML ="";
        if(month<12)
        {  month=month+1;
        }
        else
        {  month=1;
            year=year+1;
        }
        document.getElementById('div').innerHTML =showday();
    }
    //点击上个月
    function shang(){
        document.getElementById('day').innerHTML ="";
        if(month>1)
        {month=month-1;
        }
        else
        {
            month=12;
            year=year-1;
        }
        document.getElementById('div').innerHTML =showday();
    }
    showday()

</script>

<style type="text/css">
    .evrday{
        width:14%;
        float:left;
    }
    #calendar{
        display: inline-block;
        width:400px;
        margin:auto;
    }
    #calendar > div, .evrday{
        margin-top:10px;
        margin-bottom:5px;
        text-align:center;
    }
    #month{
        width:50%;
        float:left;
    }
    .mon {
        margin: 0 !important;
        width:25%;
        height:40px;
        float:left;
    }

</style>
<?php echoUOJPageFooter() ?>
