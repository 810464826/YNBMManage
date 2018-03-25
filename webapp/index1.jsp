<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <base href="${ctx}">
    <title>一家一盒</title>
    <link rel="stylesheet" href="./static/css/index.css"/>
    <script src="./static/js/jquery-1.11.3.min.js"></script>
    <script src="./static/js/index1.js"></script>
    <script src="./static/js_lib/layer/layer.js"></script>
    <script>
    function login()
    {
    	var url= "${ctx}";
    	layer.open({
            type: 2,
            //skin: 'layui-layer-lan',
            title: false,
            fix: true,
            scrollbar: false,
            shadeClose: true,
            closeBtn: false,
            shade: 0.5,
            maxmin: false,
            area: ["450px","330px"],
            content: '${ctx}/login'
            
        });
    }
    </script>
</head>
<body>
<header class="header">
    <div class="fl">
        <a href="#"><img src="./static/images/index/logo.png" alt="logoIcon"/></a>
    </div>
    <div class="fr">
        <a href="${ctx}/register" class="btn btn-register ">注&nbsp;&nbsp;册</a>
        <a href="javascript:login()" class="btn btn-login" >登&nbsp;&nbsp;录</a>
    </div>
</header>
<!--右侧的进度指示条-->
<nav class="navProgress">
    <div class="back"></div>
    <div class="front"></div>
</nav>
<button class="nextPage"  ><img src="./static/images/index/nextPage.png" alt="nextPageIcon"/></button>
<!--第一个页面-->
<section id="page1" >
    <div class="bg" ></div>
    <div class="main">
        <div class="pageCenter">
            <h2>生活如你想象</h2>
            <p>与 10000+ 家庭一起以进货价购置日常生活所需</p>
        </div>
    </div>
    <div class="btnPosition">
        <a href="${ctx}/register" class="btn creatVIP">
            <span>马上创建会员</span>
            <img src="./static/images/index/createVIPRight.png" alt="createVIPRightIcon"/>
        </a>
    </div>
</section>

<!--第二个页面-->
<section id="page2" >
    <div class="bg" ></div>
    <div class="main">
        <div class="pageCenter">
            <h2>花的更少，过得更好</h2>
            <p>以家庭为服务对象，首创“家庭集采”消费模式</p>
            <p>将家庭需求直连全球厂商，没有中间环节，没有品牌溢价</p>
            <p>这次，我们重新定义家庭消费</p>
        </div>
    </div>
    <footer class="footer">
        <div class="footer-content">
            <ul >
                <li class="li-1">
                    <a href="Help/women.html">
                        <h3>会员制消费</h3>
                        <img src="./static/images/index/p2_vipExpense.png" alt="vipExpense"/>
                    </a>
                    <p>用户付费入会，享受全年商品平价采购特权</p>

                </li>
                <li class="li-2">
                    <a href="Help/women.html">
                        <h3>家庭集采模式</h3>
                        <img src="./static/images/index/p2_family.png" alt="family"/>
                    </a>
                    <p>社区直连厂商，家庭联合下单，平台批量集采</p>

                </li>
                <li class="li-3">
                    <a href="Help/women.html">
                        <h3>零利润售卖</h3>
                        <img src="./static/images/index/p2_noProfit.png" alt="noProfit"/>
                    </a>
                    <p>平台进货价即会员采购价，全网商品零价差售卖</p>
                </li>
            </ul>
        </div>
    </footer>
</section>

<!--第三个页面-->
<section id="page3" >
    <img class="bg" src="./static/images/index/p3_bj.png" alt="page3-backgroundImage"/>
    <div class="bg" ></div>
    <div class="main">
        <div class="pageCenter">
            <h2><img style="vertical-align:middle;margin-top:-4px;" src="./static/images/index/biu.png" alt=""/> 的一下，物价回到十年前</h2>
            <p>全年固定底价供货，不受网购比价之苦，不受价格波动之痛，</p>
            <p>全网商品零价差出货，每一次都能省一半，</p>
            <p>省钱，我们是认真的。</p>
        </div>
    </div>
    <footer class="footer">
        <div class="footer-content">
            <ul >
                <li class="li-1">
                    <a href="Help/huiyuan.html#quanyi">
                        <h3>固定底价</h3>
                        <img src="./static/images/index/p3_fixedPrice.png" alt="固定底价"/>
                    </a>
                    <p>固定底价供货，啥时买都是一个价</p>
                </li>
                <li class="li-2">
                    <a href="Help/huiyuan.html#quanyi">
                        <h3>50%折扣</h3>
                        <img src="./static/images/index/p3_50per.png" alt="50%折扣"/>
                    </a>
                    <p>商品平均50%折扣，每次都能省一半</p>

                </li>
                <li class="li-3">
                    <a href="Help/huiyuan.html#quanyi">
                        <h3>零价差率</h3>
                        <img src="./static/images/index/p3_zeroRate.png" alt="零价差率"/>
                    </a>
                    <p>平台零加价率销售，进价出货没溢出</p>
                </li>
            </ul>
        </div>
    </footer>
</section>

<!--第四个页面-->
<section id="page4" >
    <div class="bg" ></div>
    <div class="main">
        <div class="pageCenter">
            <h2>遴选全球，只为觅得一手好货</h2>
            <p>以小而美的觅物之心，优选全球国家级地理标志产品，</p>
            <p>偏执于少而精的生活哲学，始终坚持单个品类仅严选1-2款好物，</p>
            <p>好物不多，拥有就好。</p>
        </div>
    </div>
    <footer class="footer">
        <div class="footer-content">
            <ul >
                <li class="li-1">
                    <a href="Help/huiyuan.html#quanyi">
                        <h3>产地货源</h3>
                        <img src="./static/images/index/p4_productArea.png" alt="产地货源"/>
                    </a>
                    <p>固定底价供货，啥时买都是一个价</p>
                </li>
                <li class="li-2">
                    <a href="Help/huiyuan.html#quanyi">
                        <h3>买手严选</h3>
                        <img src="./static/images/index/p4_buySelector.png" alt="买手严选"/>
                    </a>
                    <p>全球超300名时尚买手帮你严选家用潮品</p>
                </li>
                <li class="li-3">
                    <a href="Help/huiyuan.html#quanyi">
                        <h3>厂商直连</h3>
                        <img src="./static/images/index/p4_factoryBuss.png" alt="厂商直连"/>
                    </a>
                    <p>签约500+品牌授权直供，厂商直连品质有保障</p>
                </li>
            </ul>
        </div>
    </footer>
</section>

<!--第五个页面-->
<section id="page5">
    <div class="bg" ></div>
    <div class="main">
        <div class="pageCenter">
            <h2>因为懂家，所以服务更到家</h2>
            <p>针对每个家庭提供专属的家庭需求顾问，</p>
            <p>根据家庭消费习惯，按月制定最具性价比的家庭消费计划</p>
            <p>有计划的消费，我们更专业。</p>
        </div>
    </div>
    <button class="nextPage"  ><img  src="./static/images/index/nextPage.png" alt="nextPageIcon"/></button>
    <footer class="footer">
        <div class="footer-content">
            <ul >
                <li class="li-1">
                    <a href="Help/huiyuan.html#quanyi">
                        <h3>家庭需求顾问</h3>
                        <img src="./static/images/index/p5_familyNeed.png" alt="家庭需求顾问"/>
                    </a>
                    <p>专属家庭顾问团队，淘货砍价，有求必应</p>
                </li>
                <li class="li-2">
                    <a href="Help/huiyuan.html#quanyi">
                        <h3>商品主题定制</h3>
                        <img src="./static/images/index/p5_customize.png" alt="商品主题定制"/>
                    </a>
                    <p>高频耗品包年订购，一次下单，省心一年</p>
                </li>
                <li class="li-3">
                    <a href="Help/huiyuan.html#quanyi">
                        <h3>免单配送到家</h3>
                        <img src="./static/images/index/p5_freeSendFamily.png" alt="免单配送到家"/>
                    </a>
                    <p>按月定时定量配送，新品试用，免单到家。</p>
                </li>
            </ul>
        </div>
    </footer>
</section>

<!--第六个页面-->
<section id="page6" >
    <div class="bg" ></div>
    <div class="main">
        <div class="pageCenter">
            <h2>他们在这里发现生活的乐趣</h2>
        </div>
    </div>
    <div class="imgList">
        <div class="centerBlock">
            <dl class="active">
                <dt><img data-i="0" src="./static/images/index/p6_colorDog.png" alt="Linda"/></dt>
                <dd>
                    <h3>Linda</h3>
                    <p>自媒体美食编辑</p>
                </dd>
            </dl>
            <dl>
                <dt><img data-i="1" src="./static/images/index/p6_graySun.png" alt="Sofia"/></dt>
                <dd>
                    <h3>Sofia</h3>
                    <p>某互联网公司会计</p>
                </dd>
            </dl>
            <dl>
                <dt><img data-i="2" src="./static/images/index/p6_grayWoman.png" alt="杜女士"/></dt>
                <dd>
                    <h3>杜女士</h3>
                    <p>某电商COO</p>
                </dd>
            </dl>
        </div>
    </div>
    <footer class="footer">
        <div class="upTriangle"></div>
        <h3>“一个人生活，想要的东西又多又杂，有了一家一盒，我的小需求都在盒子里，省心了。”</h3>
    </footer>
</section>

<!--第七个页面-->
<section id="page7" >
    <div class="bg" ></div>
    <div class="main">
        <div class="pageCenter">
            <h2>现在，尝试不一样的</h2>
        </div>
    </div>
    <div class="btnPosition">
        <a href="user/toRegister" class="btn creatVIP">
            <span>马上创建会员</span>
            <img src="./static/images/index/createVIPRight.png" alt="createVIPRightIcon"/>
        </a>
    </div>

    <footer class="footer last">
            <div id="foot-one">
                <table>
                    <tr>
                        <td>
                            <p class="service">服务电话</p>
                            <p class="number">400-1369-400</p>
                            <p class="service td-3">（9:00-18:00）</p>
                        </td>
                        <td id="tab">
                            <p class="tab-one">了解一家一盒</p>
                            <p class="tab-two">一家一盒专注于家庭高频消费品类，通过集采集卖模式将家庭需求直连产地厂商，平台全程采用会员制
                                经营理念，以零利润售卖策略为家庭用户提供全球口碑好货。</p>
                        </td>
                        <td class="ceall">
                            <p>关注我们</p>
                            <img src="./static/images/index/p7_twoCode.png" alt="二维码"/>
                            <p><img src="./static/images/index/p7_weixin.png" alt="weixinIcon"/></p>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="foot-two">
                <p class="fd-one">
                    <a href="Help/women.html">关于我们</a>
                    <a href="Help/bangzhu.html">帮助中心</a>
                    <a href="Help/huiyuan.html">会员服务</a>
                    <a href="">供应商招募</a>
                    <a href="Help/shangwu.html">商务合作</a>
                    <a href="Help/lianxi.html">联系我们</a>
                </p>
                <p class="fd-two">
                    Copyright@2016四川一家一盒电子商务有限公司iYihe.com版权所有<span class="fd-ad">蜀ICP备15032832号</span>
                    公司地址：成都市人民南路四段27号商鼎国际2-1-2501室
                </p>
            </div>
    </footer>
</section>

</body>
<!--<script src="js/jquery-1.11.3.min.js"></script>-->
<!--<script src="js/index1.js"></script>-->
</html>