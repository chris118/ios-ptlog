# PTLog
### 1.使用：
* let log = PTLog(true, true, .trace, .error)
* log.trace("hello")
* log.debug(["name":"xxx", "desc":"xxx"], separator: ", ", terminator: "\n")
* log.error("any error")

### 2.显示:
* let logVC = PTLogViewController()
* present(logVC, animated: true, completion: nil)
