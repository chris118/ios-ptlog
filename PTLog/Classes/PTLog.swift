//
//  PTLog.swift
//  PTLog
//
//  Created by soso on 2017/7/18.
//  Copyright © 2017年 soso. All rights reserved.
//

import Foundation

///级别
public enum Level: Int {
    case trace
    case debug
    case info
    case warning
    case error
    
    public var description: String {
        get {
            return String(describing: self).uppercased()
        }
    }
}


open class PTLog {
    
    /// 打印开关, default is true
    open var isPrintEnabled: Bool = true
    
    /// 记录到日志的开关, default is false
    open var isLogEnabled: Bool = false
    
    /// 需要打印的最小级别, default is .warning
    open var printMinLevel: Level = .warning
    
    /// 需要记录到日志的最小级别, default is .warning
    open var logMinLevel: Level = .warning
    
    // 自用队列
    private let queue = DispatchQueue(label: "com.putao.log.queue")
    
    /// level default is .trace
    public init(_ printEnabled: Bool = true,
                _ logEnabled: Bool = false,
                _ printMinLevel: Level = .trace,
                _ logMinLevel: Level = .trace) {
        self.isPrintEnabled = printEnabled
        self.isLogEnabled = logEnabled
        self.printMinLevel = printMinLevel
        self.logMinLevel = logMinLevel
    }
    
    open func trace(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        log(.trace, items, separator, terminator, file, line, column, function)
    }
    
    open func debug(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        log(.debug, items, separator, terminator, file, line, column, function)
    }
    
    open func info(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        log(.info, items, separator, terminator, file, line, column, function)
    }
    
    open func warning(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        log(.warning, items, separator, terminator, file, line, column, function)
    }
    
    open func error(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        log(.error, items, separator, terminator, file, line, column, function)
    }
    
    private func log(_ level: Level, _ items: [Any], _ separator: String, _ terminator: String, _ file: String, _ line: Int, _ column: Int, _ function: String) {
        let row = PTLogRow(level, items, separator, terminator, file, line, column, function)
        if isPrintEnabled, level.rawValue >= self.printMinLevel.rawValue {
            queue.async {
                Swift.print(row.description)
            }
        }
        if isLogEnabled, level.rawValue >= self.logMinLevel.rawValue {
            queue.async {
                PTLogDB.shared.insert(row)
            }
        }
    }
    
}
