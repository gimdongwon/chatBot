class UsersController < ApplicationController
    def keyboard_init
        @msg =
            {
              type: "buttons",
              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
            }
        render json: @response, status: :ok 
    end
    
    def chat_control
        @response = params[:content]
        @user_key = params[:user_key]
        @user = User.find_or_create_by(password: @user_key)
        
        if @user.name == nil
            if ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"].include? @response
                @response = {
                  message: {
                      text: "More Fit에 방문해주셔서 감사합니다! 최적화 된 의류추천 서비스를 위해 성함을 알려주세요?"
                  },
                  keyboard: {
                    type: "text"
                  }
                }
                render json: @response, status: :ok
            else
                @user.name = @response
                @user.save
                @response = {
                  message: {
                      text: "환영합니다 #{@user.name}님! 버튼을 눌러주세요!"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                  }
                }
                render json: @response, status: :ok
            end
            
        else
#나에게 가장 잘 맞는 청바지 추천
          if  @response == "나에게 가장 잘맞는 청바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 청바지추천을 누르셨습니다. 추천서비스를 위해 간단한 설문을 진행하겠습니다 #{@user.name}님의 키는 어느 정도인가요?."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["청바지,166~170", "청바지,171~175"]
                  }
                }
               render json: @response, status: :ok
#키 설정 165 이하부터
                        
             #나에게 가장 잘 맞는 정장바지 추천   
                            
           elsif @response == "나에게 가장 잘맞는 정장바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 정장바지추천을 누르셨습니다. 당신의 키는?"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["정장바지,166~170", "정장바지,170~175"]
                  }
                }
                render json: @response, status: :ok
  #나에게 가장 잘 맞는 반바지 추천              
            elsif @response == "나에게 가장 잘맞는 반바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 반바지추천을 누르셨습니다. 당신의 키는?"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["반바지,166~170", "반바지,170~175"]
                  }
                }
                render json: @response, status: :ok
                elsif @response == "청바지,166~170"
                      @response = {
                        message: {
                            text: "#{@user.name}님 몇키로임?"
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지,166~170,70kg", "청바지,166~170,80kg"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지,166~170,70kg"
                                    @response = {
                                      message: {
                                          text: "#{@user.name}님에게 어울리는 상품은  ㄱ(제현) 입니다."
                                      },
                                      keyboard: {
                                        type: "buttons",
                                        buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                      }
                                    }
                                   render json: @response, status: :ok
                                   elsif @response == "청바지,166~170,80kg"
                                    @response = {
                                      message: {
                                          text: "#{@user.name}님에게 어울리는 상품은  2(펌킨) 입니다."
                                      },
                                      keyboard: {
                                        type: "buttons",
                                        buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                      }
                                    }
                                    render json: @response, status: :ok
                    elsif @response == "청바지,171~175"
                      @response = {
                        message: {
                            text: "#{@user.name}님 몇키로임?"
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지,171~175,70kg", "청바지,171~175,80kg"]
                        }
                      }
                          render json: @response, status: :ok
                                elsif @response == "청바지,171~175,70kg"
                                    @response = {
                                      message: {
                                          text: "#{@user.name}님에게 어울리는 상품은  ㄷ(윤준) 입니다."
                                      },
                                      keyboard: {
                                        type: "buttons",
                                        buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                      }
                                    }
                                  render json: @response, status: :ok
                                  
                                      elsif @response == "청바지,171~175,80kg"
                                    @response = {
                                      message: {
                                          text: "#{@user.name}님에게 어울리는 상품은  4(동원) 입니다."
                                      },
                                      keyboard: {
                                        type: "buttons",
                                        buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                      }
                                    }
                                    render json: @response, status: :ok
            else
                @response = {
                  message: {
                      text: "#{@user.name}님이 잘못된 명령어를 입력하셨습니다."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                  }
                }
                 render json: @response, status: :ok
           
           end
        end            
    end
end

