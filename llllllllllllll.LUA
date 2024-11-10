local --[[渲染加密v18]] v0=tonumber;
local --[[渲染加密v18]] v1=string.byte;
local --[[渲染加密v18]] v2=string.char;
local --[[渲染加密v18]] v3=string.sub;
local --[[渲染加密v18]] v4=string.gsub;
local --[[渲染加密v18]] v5=string.rep;
local --[[渲染加密v18]] v6=table.concat;
local --[[渲染加密v18]] v7=table.insert;
local --[[渲染加密v18]] v8=math.ldexp;
local --[[渲染加密v18]] v9=getfenv or function() return _ENV;end ;
local --[[渲染加密v18]] v10=setmetatable;
local --[[渲染加密v18]] v11=pcall;
local --[[渲染加密v18]] v12=select;
local --[[渲染加密v18]] v13=unpack or table.unpack ;
local --[[渲染加密v18]] v14=tonumber;
local --[[渲染加密v18]] function v15(v16,v17,...) 
local --[[渲染加密v18]] v18=1;
local --[[渲染加密v18]] v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then v19=v0(v3(v30,1,1));return "";else 
local --[[渲染加密v18]] v82=0;
local --[[渲染加密v18]] v83;while true do if (v82==0) then v83=v2(v0(v30,16));if v19 then 
local --[[渲染加密v18]] v99=v5(v83,v19);v19=nil;return v99;else return v83;end break;end end end end);
local --[[渲染加密v18]] function v20(v31,v32,v33) if v33 then 
local --[[渲染加密v18]] v84=0;
local --[[渲染加密v18]] v85;while true do if (v84==(0 -0)) then v85=(v31/((5 -3)^(v32-1)))%((3 -1)^(((v33-(2 -1)) -(v32-(620 -(555 + 64)))) + (1638 -(1523 + 114)))) ;return v85-(v85%(932 -(857 + 74))) ;end end else 
local --[[渲染加密v18]] v86=568 -(367 + 201) ;
local --[[渲染加密v18]] v87;while true do if (v86==(927 -(214 + 713))) then v87=(1 + 1)^(v32-(1 + 0 + 0)) ;return (((v31%(v87 + v87))>=v87) and 1) or (877 -(282 + 595)) ;end end end end 
local --[[渲染加密v18]] function v21() 
local --[[渲染加密v18]] v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end 
local --[[渲染加密v18]] function v22() 
local --[[渲染加密v18]] v35,v36=v1(v16,v18,v18 + (2 -0) );v18=v18 + (1272 -(226 + 1044)) ;return (v36 * 256) + v35 ;end 
local --[[渲染加密v18]] function v23() 
local --[[渲染加密v18]] v37,v38,v39,v40=v1(v16,v18,v18 + ((969 -(892 + 65)) -9) );v18=v18 + (121 -(32 + 85)) ;return (v40 * (40022563 -23245347)) + (v39 * (64226 + 1310)) + (v38 * (57 + 199)) + v37 ;end 
local --[[渲染加密v18]] function v24() 
local --[[渲染加密v18]] v41=0 -(1080 -(1020 + 60)) ;
local --[[渲染加密v18]] v42;
local --[[渲染加密v18]] v43;
local --[[渲染加密v18]] v44;
local --[[渲染加密v18]] v45;
local --[[渲染加密v18]] v46;
local --[[渲染加密v18]] v47;while true do if (v41==(792 -(368 + 423))) then v44=1 -0 ;v45=(v20(v43,(1189 -838) -(87 + 263) ,200 -(67 + 113) ) * ((2 + (0 -0))^(122 -(36 + 54)))) + v42 ;v41=4 -(6 -4) ;end if (((1749 -(760 + 987)) + 0)==v41) then v46=v20(v43,(1996 -(1789 + 124)) -62 ,98 -(833 -(745 + 21)) );v47=((v20(v43,14 + 18 )==(1 -0)) and  -(953 -(802 + 150))) or (439 -(145 + (1716 -(630 + 793)))) ;v41=7 -4 ;end if (v41==(1486 -(998 + 488))) then v42=v23();v43=v23();v41=(1 + 0) -0 ;end if (v41==(3 + 0)) then if (v46==(772 -(201 + 571))) then if (v45==(0 + 0)) then return v47 * (0 -(0 -0)) ;else 
local --[[渲染加密v18]] v100=997 -(915 + (321 -239)) ;while true do if (v100==(0 + 0)) then v46=2 -1 ;v44=0 + 0 ;break;end end end elseif (v46==(2691 -(6 + 638))) then return ((v45==((932 + 255) -(1069 + 118))) and (v47 * ((2 -(1056 -(87 + 968)))/(0 -0)))) or (v47 * NaN) ;end return v8(v47,v46-(362 + 661) ) * (v44 + (v45/((1 + 1)^(92 -(176 -136))))) ;end end end 
local --[[渲染加密v18]] function v25(v48) 
local --[[渲染加密v18]] v49;if  not v48 then 
local --[[渲染加密v18]] v88=0 + (1817 -(1703 + 114)) ;while true do if ((0 -0)==v88) then v48=v23();if (v48==(1413 -(447 + 966))) then return "";end break;end end end v49=v3(v16,v18,(v18 + v48) -((703 -(376 + 325)) -1) );v18=v18 + v48 ;
local --[[渲染加密v18]] v50={};for v65=1 -0 , #v49 do v50[v65]=v2(v1(v3(v49,v65,v65)));end return v6(v50);end 
local --[[渲染加密v18]] v26=v23;
local --[[渲染加密v18]] function v27(...) return {...},v12("#",...);end 
local --[[渲染加密v18]] function v28() 
local --[[渲染加密v18]] v51=(function() return 0 -0 ;end)();
local --[[渲染加密v18]] v52=(function() return;end)();
local --[[渲染加密v18]] v53=(function() return;end)();
local --[[渲染加密v18]] v54=(function() return;end)();
local --[[渲染加密v18]] v55=(function() return;end)();
local --[[渲染加密v18]] v56=(function() return;end)();
local --[[渲染加密v18]] v57=(function() return;end)();
local --[[渲染加密v18]] v58=(function() return;end)();while true do 
local --[[渲染加密v18]] v67=(function() return 241 -(187 + 54) ;end)();while true do if (v67==0) then if (v51~=(781 -(162 + 618))) then else 
local --[[渲染加密v18]] v97=(function() return 0 + 0 ;end)();while true do if (v97~=(1 + 0)) then else v58=(function() return {};end)();for v113= #" ",v57 do 
local --[[渲染加密v18]] v114=(function() return 0 -0 ;end)();
local --[[渲染加密v18]] v115=(function() return;end)();
local --[[渲染加密v18]] v116=(function() return;end)();
local --[[渲染加密v18]] v117=(function() return;end)();while true do if (v114==(1 -0)) then v117=(function() return nil;end)();while true do if ((0 + 0)==v115) then 
local --[[渲染加密v18]] v169=(function() return 1636 -(1373 + 263) ;end)();while true do if (v169==1) then v115=(function() return 1001 -(451 + 549) ;end)();break;end if (v169~=(0 + 0)) then else v116=(function() return v21();end)();v117=(function() return nil;end)();v169=(function() return 1;end)();end end end if (v115==1) then if (v116== #"[") then v117=(function() return v21()~=0 ;end)();elseif (v116==2) then v117=(function() return v24();end)();elseif (v116== #"-19") then v117=(function() return v25();end)();end v58[v113]=(function() return v117;end)();break;end end break;end if (v114~=0) then else v115=(function() return 0;end)();v116=(function() return nil;end)();v114=(function() return 1 -0 ;end)();end end end v97=(function() return 2;end)();end if (v97==(2 -0)) then v51=(function() return 1386 -(746 + 638) ;end)();break;end if (v97~=0) then else v56=(function() return {v53,v54,nil,v55};end)();v57=(function() return v23();end)();v97=(function() return 1;end)();end end end if (v51~=(0 + 0)) then else v52=(function() return function(v104,v105,v106) 
local --[[渲染加密v18]] v107=(function() return 0;end)();
local --[[渲染加密v18]] v108=(function() return;end)();while true do if (v107~=(0 -0)) then else v108=(function() return 341 -(218 + 123) ;end)();while true do if (v108~=(1581 -(1535 + 46))) then else 
local --[[渲染加密v18]] v157=(function() return 0;end)();while true do if (v157~=(0 + 0)) then else 
local --[[渲染加密v18]] v172=(function() return 0;end)();while true do if (v172==(0 + 0)) then v104[v105-#"}" ]=(function() return v106();end)();return v104,v105,v106;end end end end end end break;end end end;end)();v53=(function() return {};end)();v54=(function() return {};end)();v55=(function() return {};end)();v51=(function() return 1;end)();end v67=(function() return 561 -(306 + 254) ;end)();end if (v67==1) then if (v51==(1 + 1)) then v56[ #"gha"]=(function() return v21();end)();for v101= #",",v23() do 
local --[[渲染加密v18]] v102=(function() return v21();end)();if (v20(v102, #"<", #".")==0) then 
local --[[渲染加密v18]] v109=(function() return 0;end)();
local --[[渲染加密v18]] v110=(function() return;end)();
local --[[渲染加密v18]] v111=(function() return;end)();
local --[[渲染加密v18]] v112=(function() return;end)();while true do if (v109==2) then if (v20(v111, #".", #".")== #">") then v112[2]=(function() return v58[v112[3 -1 ]];end)();end if (v20(v111,2,2)== #"|") then v112[ #"xxx"]=(function() return v58[v112[ #"gha"]];end)();end v109=(function() return 1470 -(899 + 568) ;end)();end if (v109==3) then if (v20(v111, #"gha", #"nil")== #"\\") then v112[ #"http"]=(function() return v58[v112[ #"0313"]];end)();end v53[v101]=(function() return v112;end)();break;end if (v109==1) then v112=(function() return {v22(),v22(),nil,nil};end)();if (v110==0) then 
local --[[渲染加密v18]] v161=(function() return 0 + 0 ;end)();
local --[[渲染加密v18]] v162=(function() return;end)();while true do if (v161==(0 -0)) then v162=(function() return 603 -(268 + 335) ;end)();while true do if ((290 -(60 + 230))==v162) then v112[ #"nil"]=(function() return v22();end)();v112[ #"asd1"]=(function() return v22();end)();break;end end break;end end elseif (v110== #".") then v112[ #"91("]=(function() return v23();end)();elseif (v110==2) then v112[ #"-19"]=(function() return v23() -(2^(588 -(426 + 146))) ;end)();elseif (v110== #"gha") then 
local --[[渲染加密v18]] v179=(function() return 0 + 0 ;end)();
local --[[渲染加密v18]] v180=(function() return;end)();while true do if (0~=v179) then else v180=(function() return 1456 -(282 + 1174) ;end)();while true do if (v180==0) then v112[ #"91("]=(function() return v23() -(2^(827 -(569 + 242))) ;end)();v112[ #"xnxx"]=(function() return v22();end)();break;end end break;end end end v109=(function() return 2;end)();end if (v109~=0) then else 
local --[[渲染加密v18]] v134=(function() return 0;end)();while true do if (v134~=(0 -0)) then else v110=(function() return v20(v102,2, #"nil");end)();v111=(function() return v20(v102, #"xnxx",1 + 5 );end)();v134=(function() return 1025 -(706 + 318) ;end)();end if (v134~=(1252 -(721 + 530))) then else v109=(function() return 1272 -(945 + 326) ;end)();break;end end end end end end for v103= #"|",v23() do v54,v103,v28=(function() return v52(v54,v103,v28);end)();end return v56;end break;end end end end 
local --[[渲染加密v18]] function v29(v59,v60,v61) 
local --[[渲染加密v18]] v62=v59[2 -1 ];
local --[[渲染加密v18]] v63=v59[2];
local --[[渲染加密v18]] v64=v59[3];return function(...) 
local --[[渲染加密v18]] v68=v62;
local --[[渲染加密v18]] v69=v63;
local --[[渲染加密v18]] v70=v64;
local --[[渲染加密v18]] v71=v27;
local --[[渲染加密v18]] v72=1 + (405 -(118 + 287)) ;
local --[[渲染加密v18]] v73= -(701 -(271 + 429));
local --[[渲染加密v18]] v74={};
local --[[渲染加密v18]] v75={...};
local --[[渲染加密v18]] v76=v12("#",...) -(1501 -((5518 -4110) + 92)) ;
local --[[渲染加密v18]] v77={};
local --[[渲染加密v18]] v78={};for v89=1086 -(461 + 625) ,v76 do if (v89>=v70) then v74[v89-v70 ]=v75[v89 + 1 ];else v78[v89]=v75[v89 + (1289 -(993 + 295)) ];end end 
local --[[渲染加密v18]] v79=(v76-v70) + 1 + 0 ;
local --[[渲染加密v18]] v80;
local --[[渲染加密v18]] v81;while true do 
local --[[渲染加密v18]] v90=1171 -(418 + 753) ;while true do if (v90==(0 + 0)) then v80=v68[v72];v81=v80[1 + 0 ];v90=1;end if ((v90==(1 + 0)) or (1869==2009)) then if ((v81<=(1 + 2)) or (3546<2322)) then if ((v81<=(530 -(406 + 123))) or (2082==4773)) then if ((3244>1055) and (v81>(1769 -(1749 + 20)))) then do return;end else v78[v80[(1122 -(118 + 1003)) + 1 ]]={};end elseif (v81==2) then v78[v80[1324 -(1249 + 73) ]]=v80[2 + 1 ];else 
local --[[渲染加密v18]] v121=v80[1147 -(466 + 679) ];
local --[[渲染加密v18]] v122=v78[v80[6 -3 ]];v78[v121 + 1 ]=v122;v78[v121]=v122[v80[11 -(20 -13) ]];end elseif (v81<=5) then if ((v81>4) or (3313<=1778)) then 
local --[[渲染加密v18]] v126=1900 -(106 + 1794) ;
local --[[渲染加密v18]] v127;
local --[[渲染加密v18]] v128;
local --[[渲染加密v18]] v129;
local --[[渲染加密v18]] v130;while true do if ((0 + 0)==v126) then v127=v80[1 + 1 ];v128,v129=v71(v78[v127](v13(v78,v127 + (2 -(378 -(142 + 235))) ,v80[7 -4 ])));v126=115 -(4 + 110) ;end if (((586 -(57 + 527))==v126) or (1421>=2104)) then for v166=v127,v73 do v130=v130 + (1428 -(41 + 1386)) ;v78[v166]=v128[v130];end break;end if ((1812<=3249) and (v126==(104 -(17 + 86)))) then v73=(v129 + v127) -(1 + 0) ;v130=0 -0 ;v126=5 -3 ;end end else v78[v80[168 -(122 + 44) ]]=v61[v80[5 -2 ]];end elseif ((1623<=1957) and (v81<=((86 -67) -13))) then v78[v80[2 + 0 + 0 ]]();elseif (v81>(2 + 5)) then 
local --[[渲染加密v18]] v135=v80[3 -1 ];v78[v135]=v78[v135](v13(v78,v135 + (66 -(30 + 35)) ,v73));else 
local --[[渲染加密v18]] v137;
local --[[渲染加密v18]] v138,v139;
local --[[渲染加密v18]] v140;
local --[[渲染加密v18]] v141;v78[v80[2 + 0 ]]={};v72=v72 + 1 ;v80=v68[v72];v78[v80[1259 -(1043 + 214) ]]=v61[v80[11 -8 ]];v72=v72 + (1213 -(323 + 889)) ;v80=v68[v72];v78[v80[5 -(980 -(553 + 424)) ]]=v61[v80[583 -(361 + 219) ]];v72=v72 + (321 -(53 + 267)) ;v80=v68[v72];v141=v80[1 + 1 ];v140=v78[v80[(786 -370) -(15 + 398) ]];v78[v141 + 1 ]=v140;v78[v141]=v140[v80[986 -(16 + 2 + 964) ]];v72=v72 + (3 -2) ;v80=v68[v72];v78[v80[2 + 0 + 0 ]]=v80[2 + 1 ];v72=v72 + (851 -(20 + 830)) ;v80=v68[v72];v141=v80[2 + 0 + 0 ];v138,v139=v71(v78[v141](v13(v78,v141 + (127 -(116 + 10)) ,v80[1 + 2 ])));v73=(v139 + v141) -(739 -(542 + 84 + 112)) ;v137=0;for v164=v141,v73 do 
local --[[渲染加密v18]] v165=0 -0 ;while true do if ((4412==4412) and (v165==0)) then v137=v137 + 1 + 0 ;v78[v164]=v138[v137];break;end end end v72=v72 + 1 + 0 ;v80=v68[v72];v141=v80[2];v78[v141]=v78[v141](v13(v78,v141 + 1 + 0 ,v73));v72=v72 + 1 + 0 ;v80=v68[v72];v78[v80[4 -2 ]]();v72=v72 + (2 -1) ;v80=v68[v72];do return;end end v72=v72 + ((3364 -1812) -(1126 + 425)) ;break;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!043Q00030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q747047657403203Q00682Q7470733A2Q2F706173746566792E612Q702F33754176617A59752F72617700094Q00077Q00122Q000100013Q00122Q000200023Q00202Q00020002000300122Q000400046Q000200046Q00013Q00024Q0001000100016Q00017Q00",v9(),...);
