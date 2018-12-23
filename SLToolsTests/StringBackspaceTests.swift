//
//  StringBackspaceTests.swift
//  SLToolsTests
//
//  Created by kentjia on 2018/12/23.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import XCTest
@testable import SLTools

class StringBackspaceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBackspaceSubstring() {
        // thai
        let thai = "ยุ"
        let thaiSubstrings = thai.sl_backspaceSubstrings()
        XCTAssert(thaiSubstrings.count == 2)
        if let first = thaiSubstrings.first {
            XCTAssert(first == "ย")
        }
        if let last = thaiSubstrings.last {
            XCTAssert(last == "ุ")
        }
        
        // korean
        let korean = "한국어"
        let koreanSubstrings = korean.sl_backspaceSubstrings()
        XCTAssert(koreanSubstrings.count == 3)
        
        // emoji
        let textEmoji = "𓀀☾☻☺︎✄☥☩⚙︎⚭♘♚♛✺✻↓⇊➴↰▦◫┙┮◰▎≉≐≼≷⊳⋈ℍℝ㎭㎣㎛㏚㏇ⒻⒿⓏ"
        let textEmojiSubstrings = textEmoji.sl_backspaceSubstrings()
        XCTAssert(textEmoji.count == textEmojiSubstrings.count)
        
        let emoji_1 = "😀🤩🥳🤔🤭👺🤡✌🏾🤟🏿🧠🗣👶👮‍♂️👨‍🚒👩🏻‍✈️👼🏼🤰🏽👯‍♀️👯‍♂️👨‍👨‍👧‍👧👩‍👦👨‍❤️‍💋‍👨👫👩‍👧👨‍👦‍👦🎩🧢🌂"
        let emoji_1_subs = emoji_1.sl_backspaceSubstrings()
        XCTAssert(emoji_1.count == emoji_1_subs.count)
        
        let emoji_2 = "🐶🐺🐗🦈🐊🕊🐇🥀🌺🌈☀️🌫"
        let emoji_2_subs = emoji_2.sl_backspaceSubstrings()
        XCTAssert(emoji_2.count == emoji_2_subs.count)
        
        let emoji_3 = "🍏🥖🥨🍚🍘🍻🥂🧂"
        let emoji_3_subs = emoji_3.sl_backspaceSubstrings()
        XCTAssert(emoji_3.count == emoji_3_subs.count)
        
        let emoji_4 = "⚽️🏋🏼‍♀️🏋️‍♂️🥇🥈🧩🎬"
        let emoji_4_subs = emoji_4.sl_backspaceSubstrings()
        XCTAssert(emoji_4.count == emoji_4_subs.count)
        
        let emoji_5 = "🚗🚅🚈🗽🗼🏨🏪🌁"
        let emoji_5_subs = emoji_5.sl_backspaceSubstrings()
        XCTAssert(emoji_5.count == emoji_5_subs.count)
        
        let emoji_6 = "⌚️🎛🧭🔩⚙️🧹🧺🧧✉️🗳🗄🖌🖍"
        let emoji_6_subs = emoji_6.sl_backspaceSubstrings()
        XCTAssert(emoji_6.count == emoji_6_subs.count)
        
        let emoji_7 = "❤️♉️💔♊️🈹🈵🈲🔆〽️✅🌐Ⓜ️🅿️🚼🚻⏏️*️⃣▶️🔂🔄➗🔺🔛🔻🃏🎴🕔🕧"
        let emoji_7_subs = emoji_7.sl_backspaceSubstrings()
        XCTAssert(emoji_7.count == emoji_7_subs.count)
        
        let emoji_8 = "🏳️🇵🇰🇵🇾🇷🇺🇪🇨🇧🇶🇸🇽🇲🇦🇲🇨🇸🇨🇸🇦🇻🇺🇬🇹🇮🇴🇯🇴🇨🇳"
        let emoji_8_subs = emoji_8.sl_backspaceSubstrings()
        XCTAssert(emoji_8.count == emoji_8_subs.count)
        
        // zero width joiner
        let zwj_chars = "h\u{200D}ello"
        let zwj_chars_subs = zwj_chars.sl_backspaceSubstrings()
        XCTAssert(zwj_chars_subs.count == 5)
        
        // variation selector
        let variation_chars = "h\u{FE0F}e"
        let variation_chars_subs = variation_chars.sl_backspaceSubstrings()
        XCTAssert(variation_chars_subs.count == 2)
        
        // variation selector supplyment
        let var_sup_chars = "h\u{E0100}e"
        let var_sup_chars_subs = var_sup_chars.sl_backspaceSubstrings()
        XCTAssert(var_sup_chars_subs.count == 2)
    }

}
