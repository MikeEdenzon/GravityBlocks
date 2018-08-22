<h1>Gravity Blocks</h1>
<img src="https://github.com/medenzon/GravityBlocks/blob/master/Diagrams/demo.gif" width="375px" align="right"></img>
<p>
  Gravity Blocks is an iOS app that demonstrates the use of
  <a href="https://developer.apple.com/documentation/coremotion">CoreMotion</a>,
  <a href="https://developer.apple.com/documentation/uikit/uicollisionbehavior">UICollisionBehavior</a> and
  <a href="https://developer.apple.com/documentation/uikit/uigravitybehavior">UIGravityBehavior</a>.
<br>
<br>
  Using <a href="https://developer.apple.com/documentation/coremotion">CoreMotion</a>, the iPhone's accelerometer updates the         it's acceleration data one thousand times per second. At each update interval, <a href="https://developer.apple.com/documentation/uikit/uigravitybehavior">UIGravityBehavior</a> receives the accelerometer data and applies it as a directional vector (<i>Δx</i>, <i>Δy</i>) to each <a href="https://developer.apple.com/documentation/uikit/uidynamicitem">UIDynamicItem</a>, or "block." The blocks accelerate in the given direction, which is updated on each interval. This gives the illusion that each block is falling in the direction that the iPhone is tilted.
</p>
<img src="https://github.com/medenzon/GravityBlocks/blob/master/Diagrams/accelerometer.png" width="400px">
<br>
<h2>Build & Run Instructions</h2>
  <ol>
    <li>Open &nbsp; <code>GravityBlocks.xcodeproj</code></li>
    <li>Connect your iOS device</li>
    <li>Click 'Run' &nbsp; (⌘+R)</li>
  </ol>
<br>
<p>
  Notes: Gravity Blocks is written in <a href="https://swift.org">Swift 3.3</a> and can be deployed to any iOS device running <a href="https://en.wikipedia.org/wiki/IOS_10">iOS 10.3</a> or later. The Xcode simulator cannot make use of the iPhone's accelerometer, therefore, it is recommended that Gravity Blocks run on a physical iOS device.
</p>
