//
//  ViewController.swift
//  SecondWeekProject
//
//  Created by 남현정 on 2024/01/02.
//

import UIKit
/*
 1. Git
 2. 실기기에서 시뮬돌리려면 개발자계정?!
 3. 아이패드랑 잭 준비하기 (내일?!)ㅎㅋㅎ
 */
/*
 [키워드]
 App LifeCycle: AppDelegate / SceneDelegate
 
 UIView tag
 DateFormatter
 @available
 Alert/ActionSheet
 
 Function Return / @discardableResult / implicit return
 NavigationItem / BarButtonItem
 */
class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var day100Label: UILabel!
    @IBOutlet var day200Label: UILabel!
    @IBOutlet var day300Label: UILabel!
    @IBOutlet var day400Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("2")
        print("3")
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date // 날짜만 나오도록
        /* 내가 한 거
        let labelList: [UILabel] = [day100Label, day200Label, day300Label, day400Label]
        let labelTextList = ["D + 100", "D + 200", "D + 300", "D + 400"]
        
        for i in 0..<4 {
            designLabel(labelList[i], text: labelTextList[i])
        }
         */
        
        /*
        dayLabel(day100Label, text: "D + 100")
        dayLabel(day200Label, text: "D + 200")
        */
        
        /*
        // 또는 딕셔너리로 구성해보기(효율적이지 않을수도 있다.)
        // UILable?로 유추하기떄문에 UILabel로 명시해주면 아래for문에서 오류나지 않는다.
        let dictionary: [Int: UILabel] = [100: day100Label,
                          200: day200Label,
                          300: day300Label,
                          400: day400Label]
        
        print(dictionary)
        
        for (key, value) in dictionary { // 튜플형태로 받아짐
            // dayLabel(item.value, text: "\(item.key)")
            dayLabel(value, text: "\(key)")
        }
        */
        
        // tag 사용해서 text출력하기. tag사용은 무궁무진!!
        dayLabel(day100Label)
        dayLabel(day200Label)        
        dayLabel(day300Label)
        dayLabel(day400Label)

        // 처음에 켰을 때 value changed가 되지 않더라도 강제로 한 번 호출
        datePickerValueChanged(datePicker)
        
        // 코드로 navigationTitle달기
        // 일관적인 것은 네비게이션컨트롤러의 바에서 조정(각자는 Item에서)
        setNavigationItem()
        
        getRandomTitle() // @discardableResult(반환값안써도 무시해라)를 함수위에 써주면 됨 -> 노란 오류 사라짐
    }

    func setNavigationItem() -> Void { // 반환값이 없으면 Void생략가능(Void는 튜플..나중에 배운다)
        
        let text = "jmt".uppercased() // 여기서 한 번만 uppercased()해주면 효율적
        
        if text == "JMT" {
            
        } else if text == "아샷추" {
            
        } else if text == "알잘딱깔센" {
            
        }
        
        

        
        // 랜덤으로 타이틀을 정하는것까지 이 함수에 하기에는 너무 많음
        // 최대한 하나의 함수에는 하나의 기능을 넣도록 하자.
        
        // viw처럼 이미 이름이 navigationItem으로 정해져있다.
        // titleView : 이미지 넣고싶을떄?
        
        let value = getRandomTitle()
        navigationItem.title = value
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(rightBarButtonClicked)) // 그림만 들어갈수도 있으니까 title은 String? 옵셔널
        // 보통 .plain을 사용, selector은 오브젝트씨의 잔재, self: 뷰컨트롤러에서 실행하겠다는 의미
    }
    
    @discardableResult
    func getRandomTitle() -> String {
        var list = ["오땅님의 기념일", "히히히", "해피뉴이얼", "새해 복 많이 받으세요", "쓸게 없어", "푸바오귀여워", "아이바오", "러바오"]
        print(list)
//        list.shuffle() // 원본이 바뀐것!
        let result = list.shuffled() // 반환값이 있음
        /*
        list.reverse() // 원본을 역으로
        let result = list.reversed() // 반환
         */
        let random = list[0]
        print(list)
        print(result)
//        let random = list.randomElement()!
        
        
        return random // 반환후 함수종료. return 밑에 코드를 쓰면 실행되지 않음
    }
    
    // @objc가 붙는다. selector로 연결하려면 필요. 스토리보드에서 @IBAction으로 하지 않더라도 이렇게 함수 호출 가능
    @objc func rightBarButtonClicked() {
        print("rightbarButton Clicked!!")
        // HIG 알럿, 액션시트
        
        // 1. 알럿 컨텐츠title: 굵은 제목, message: 그 밑의 문구
        // alert는 버튼을 무조건 눌러야함. actionsheet Style은 바탕누르면 됨(액션시트는 타이틀과 메세지 잘 안씀.-> nil을 인자로 넘겨주면 됨)
//        let alert = UIAlertController(title: "기념일 저장", message: "이 날짜를 저장하시겠습니까?", preferredStyle: .alert)
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 2. 버튼 생성
        // alert에 실행될 action
        // destructive : ?
        // 버튼 눌렀을ㄷ 때 동작은 스토리보드로 ㅓ리할 수 없어서 handler매개변수를 사용할 수 있겠다.
        let button1 = UIAlertAction(title: "버튼1", style: .cancel)//cancel자리를 애플에서 지정 : 무조건 alert에서는 왼쪽/ actionsheet일떄는 아래 => HIG
        let button2 = UIAlertAction(title: "버튼2", style: .destructive) // destructive는 빨간색 글씨..
        let button3 = UIAlertAction(title: "버튼3", style: .default)
        let button4 = UIAlertAction(title: "버튼4", style: .default)
        
        // 3. 컨텐츠붙은 공간 + 버튼이랑 붙이기. 까지를 코드로 구현
        // 1,2버튼만 있었다면 왼쪽, 오른쪽에 붙어서 나옴. 3개부터는 수직으로 붙는다
        // cancel타입이 두 개 넣는다면 오류.. 하나만 쓰기
        alert.addAction(button1) // addAction순서로 수직으로 붙음. button1의 스탙일이 cancel이라 맨아래나 맨왼쪽으로 붙게되어있음
        alert.addAction(button3)
        alert.addAction(button2)
        alert.addAction(button4)
        
        // 4. 사용자에게 붙인거 띄워주기 : 띄우는 기능은 present, 보통 animated는 true로 해주는 편..
        present(alert, animated: true) // UIAlertController도 UIViewController을 상속하기 때문에 들어갈 수 있다.
    }
    
    // 데이터피커도 value changed, 값이 바뀌는 상태일떄만 호출되는 함수
    // 인라인에서는 날짜를 클릭할 때, 휠은 멈추는 순간에 숫자 인식
    // 영국 표준시 기준으로 출력
    // 해결1. 올바른 시간으로 조정(9시간 더하는건 좋은 방법이 아님)
    // 2. 보기에 편한 포맷으로 변경
    // -> DateFormatter가 한번에 해결
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
//        print(datePicker.date)
//        print(result) // DateFormatter로 가공한 후에는 시간도 한국에 맞게 잘 나온다
        
        // numberOfLines가 2이상이어야 잘 나온다.
        /*
        day100Label.text = """
                            D + \(day100Label.tag)
                            \(result)
                            """
        */
        
        // 줄바꿈 키워드
        day100Label.text = "D + \(day100Label.tag)\n\n\(changeDateFormat())"
        
        
    }
    // implict return (swift5.1+, return 생략가능)
    func getRandomNumber() -> Int {
        Int.random(in: 1...100) // 한줄이면 return 생략가능
    }
    
    func changeDateFormat() -> String {
        // print(datePicker.date) // 날짜? 찍히는 시간이 이상하다.(영국표준시기준으로 나온다. -> 한국과는 9시간 차이)
        
        let format = DateFormatter()
        // YYYY보다 yyyy를 쓰자 - yyyy:실제년도, YYYY: 해외에서 쓰는 주번호때문에(주의)
        format.dateFormat = "yy년 MM월 dd일"
//        format.dateFormat = "yyyy년 M월 d일 hh mm EEEE E a" // 01월 -> 1월
        
        let result = format.string(from: datePicker.date)
        return result
    }
    
    func dayLabel(_ label: UILabel) {
        
        print(label.tag) // UIView가 가진 속성(뷰에 태그값을 달아서 구별해주도록, 딕셔너리라 순서대로 출력되지는 않음
        label.text = "D + \(label.tag)"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.backgroundColor = .red.withAlphaComponent(0.3) // 색에 alpha주기
        label.textColor = .white
        label.numberOfLines = 0
    }
    
    func designLabel(_ label: UILabel, text: String) {
        label.text = text
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.backgroundColor = .red.withAlphaComponent(0.3) // 색에 alpha주기
        label.textColor = .white
    }
}
