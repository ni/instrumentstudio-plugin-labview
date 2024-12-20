<?xml version='1.0' encoding='UTF-8'?>
<Library LVVersion="21008000">
	<Property Name="EndevoGOOP_ColorFrame" Type="UInt">0</Property>
	<Property Name="EndevoGOOP_ColorHeader" Type="UInt">12110847</Property>
	<Property Name="EndevoGOOP_ColorPrivate" Type="UInt">16777215</Property>
	<Property Name="EndevoGOOP_ColorPublic" Type="UInt">16448250</Property>
	<Property Name="EndevoGOOP_ColorTextBody" Type="UInt">1</Property>
	<Property Name="EndevoGOOP_ColorTextHeader" Type="UInt">0</Property>
	<Property Name="EndevoGOOP_FrameThickness" Type="UInt">1</Property>
	<Property Name="NI.Lib.Icon" Type="Bin">)1#!!!!!!!)!"1!&amp;!!!-!%!!!@````]!!!!"!!%!!!)Z!!!*Q(C=\&gt;7^53."%)&lt;B4R1'LD+A:*\&lt;+3A"'4)Q=$M&amp;O6$M&amp;5KB5V!+MP!\";7A&amp;*:XBG:0/**T5"4&amp;,#/E&lt;X\[98?V3,X&gt;3.=;,\5`:VO.V\SR^`:BH!&lt;?]Z0RU[4'0[[@^PW8D_@74`6&lt;Z&lt;@R$`80_3]U`&lt;&lt;@^L0&lt;Q]5PQ;&gt;`$W:K$S*[UI0O&gt;&amp;-L/S:ZEC&gt;ZEC&gt;ZEA&gt;ZE!&gt;ZE!&gt;ZE$OZETOZETOZEROZE2OZE2OZE@?$8/1C&amp;TGEJ(B3+.EUW3#:$%8*3_**0)EH]@"2C3@R**\%EXC9IM34?"*0YEE],&amp;0C34S**`%E(L&lt;KEOQ(/:\%Q`9+0)%H]!3?Q%.*":Y!%"1,.AYWA;&amp;A-(A4?!*0Y/'N!E`A#4S"*`!QL-!4?!*0Y!E],/FH*&lt;KG(?2YW%;/R`%Y(M@D?.B;DM@R/"\(YXAI*]@D?"S%5^$:()+=2=Y%ZY0D=4T]EO.R0)\(]4A?BPI6]HZGGK9&gt;Z(A-D_%R0)&lt;(],#&amp;$)`B-4S'R`#QL1S0Y4%]BM@Q5%K'R`!9(A.C&amp;+7]D-W-B=9E)T!]`03\R@J6CC[R@EBV][JO3N8.JLK*6$?([K+L,K&lt;K)KF/POKEKE[7[C3I`DA67I62&amp;6%N&lt;B.VZ06!X^.X^#V^1V`4F`1&amp;@&gt;[7`O?*R_.2B]."_`V?O^V/W_V7G]V'[`6;S_63C]6#]`F]?AT==EQ0B,@HUA0PHY&lt;\F_&amp;[.@M\X$U/QWLW^,R[;@E8`(`_"M^'8?GU"O@I&amp;;GR5?Q!!!!!</Property>
	<Property Name="NI.Lib.SourceVersion" Type="Int">553680896</Property>
	<Property Name="NI.Lib.Version" Type="Str">1.0.0.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">false</Property>
	<Item Name="controls" Type="Folder">
		<Item Name="Configuration.ctl" Type="VI" URL="../controls/Configuration.ctl"/>
		<Item Name="Data.ctl" Type="VI" URL="../controls/Data.ctl"/>
		<Item Name="Game of Life.ctl" Type="VI" URL="../controls/Game of Life.ctl"/>
	</Item>
	<Item Name="subVIs" Type="Folder">
		<Item Name="Helpers" Type="Folder">
			<Property Name="NI.SortType" Type="Int">3</Property>
			<Item Name="Align Error Message.vi" Type="VI" URL="../subVIs/Helpers/Align Error Message.vi"/>
			<Item Name="Initialize Game.vi" Type="VI" URL="../subVIs/Helpers/Initialize Game.vi"/>
			<Item Name="Get System Document Path.vi" Type="VI" URL="../subVIs/Helpers/Get System Document Path.vi"/>
			<Item Name="Get 8 Neighbors.vi" Type="VI" URL="../subVIs/Helpers/Get 8 Neighbors.vi"/>
			<Item Name="Get Log Directory Path.vi" Type="VI" URL="../subVIs/Helpers/Get Log Directory Path.vi"/>
			<Item Name="Get Neighbor Coordinates.vi" Type="VI" URL="../subVIs/Helpers/Get Neighbor Coordinates.vi"/>
			<Item Name="Get Neighbor Values.vi" Type="VI" URL="../subVIs/Helpers/Get Neighbor Values.vi"/>
			<Item Name="Next Generation.vi" Type="VI" URL="../subVIs/Helpers/Next Generation.vi"/>
			<Item Name="Wrap Coordinates.vi" Type="VI" URL="../subVIs/Helpers/Wrap Coordinates.vi"/>
			<Item Name="Enum to Variant Array.vi" Type="VI" URL="../subVIs/Helpers/Enum to Variant Array.vi"/>
			<Item Name="Log Events.vi" Type="VI" URL="../subVIs/Helpers/Log Events.vi"/>
			<Item Name="Wrap Next Generation.vi" Type="VI" URL="../subVIs/Helpers/Wrap Next Generation.vi"/>
			<Item Name="Add Event.vi" Type="VI" URL="../subVIs/Helpers/Add Event.vi"/>
		</Item>
		<Item Name="Message Queue" Type="Folder">
			<Item Name="support" Type="Folder">
				<Item Name="All Message Queues.ctl" Type="VI" URL="../subVIs/Message Queue/All Message Queues.ctl"/>
				<Item Name="Enqueue Message (Array).vi" Type="VI" URL="../subVIs/Message Queue/Enqueue Message (Array).vi"/>
				<Item Name="Enqueue Message (Single).vi" Type="VI" URL="../subVIs/Message Queue/Enqueue Message (Single).vi"/>
				<Item Name="Message Cluster.ctl" Type="VI" URL="../subVIs/Message Queue/Message Cluster.ctl"/>
			</Item>
			<Item Name="Create All Message Queues.vi" Type="VI" URL="../subVIs/Message Queue/Create All Message Queues.vi"/>
			<Item Name="Dequeue Message.vi" Type="VI" URL="../subVIs/Message Queue/Dequeue Message.vi"/>
			<Item Name="Enqueue Message.vi" Type="VI" URL="../subVIs/Message Queue/Enqueue Message.vi"/>
			<Item Name="Obtain Message Queue.vi" Type="VI" URL="../subVIs/Message Queue/Obtain Message Queue.vi"/>
		</Item>
		<Item Name="User Event" Type="Folder">
			<Item Name="Create User Event - Stop.vi" Type="VI" URL="../subVIs/User Event - Stop/Create User Event - Stop.vi"/>
			<Item Name="Destroy User Event - Stop.vi" Type="VI" URL="../subVIs/User Event - Stop/Destroy User Event - Stop.vi"/>
			<Item Name="Fire User Event - Stop.vi" Type="VI" URL="../subVIs/User Event - Stop/Fire User Event - Stop.vi"/>
		</Item>
		<Item Name="Check Loop Error.vi" Type="VI" URL="../subVIs/Check Loop Error.vi"/>
		<Item Name="Error Handler - Event Handling Loop.vi" Type="VI" URL="../subVIs/Error Handler - Event Handling Loop.vi"/>
		<Item Name="Error Handler - Message Handling Loop.vi" Type="VI" URL="../subVIs/Error Handler - Message Handling Loop.vi"/>
	</Item>
	<Item Name="Main.vi" Type="VI" URL="../Main.vi"/>
</Library>
