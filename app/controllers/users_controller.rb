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
                
            end
        else
#나에게 가장 잘 맞는 청바지 추천
             if @response == "나에게 가장 잘맞는 청바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 청바지추천을 누르셨습니다. 추천서비스를 위해 간단한 설문을 진행하겠습니다 #{@user.name}님의 키는 어느 정도인가요?."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["166~170", "171~175"]
                  }
                }
                render json: @response, status: :ok and return
#키 설정 165 이하부터
                        if @response == "166~170"
                @response = {
                  message: {
                      text: "#{@user.name}님 몇키로임?"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["70", "80"]
                  }
                }
                render json: @response, status: :ok and return
                                      if @response == "70"
                                    @response = {
                                      message: {
                                          text: "#{@user.name}님에게 어울리는 상품은  ㄱ(제현) 입니다."
                                      },
                                      keyboard: {
                                        type: "buttons",
                                        buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                      }
                                    }
                                   
                                   
                                      elsif @response == "80"
                                    @response = {
                                      message: {
                                          text: "#{@user.name}님에게 어울리는 상품은  2(펌킨) 입니다."
                                      },
                                      keyboard: {
                                        type: "buttons",
                                        buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                      }
                                    }
                                    render json: @response, status: :ok and return
                                  end
                                  
                        else @response == "171~175"
                           @response = {
                             message: {
                               text: "#{@user.name}님의 몸무게는 어느정도이니?"
                             },
                               keyboard: {
                                 type: "buttons",
                                 buttons: ["70","80"]
                               }
                             }
                            
                                if @response == "70"
                                    @response = {
                                      message: {
                                          text: "#{@user.name}님에게 어울리는 상품은  ㄷ(윤준) 입니다."
                                      },
                                      keyboard: {
                                        type: "buttons",
                                        buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                      }
                                    }
                                    
                                      elsif @response == "80"
                                    @response = {
                                      message: {
                                          text: "#{@user.name}님에게 어울리는 상품은  4(동원) 입니다."
                                      },
                                      keyboard: {
                                        type: "buttons",
                                        buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                      }
                                    }
                                   render json: @response, status: :ok and return
                                end
                                
                              end
                              
                              #나에게 가장 잘 맞는 정장바지 추천   
                            
           elsif @response == "나에게 가장 잘맞는 정장바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 정장바지추천을 누르셨습니다."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
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
                    buttons: ["170", "180"]
                  }
                }
                render json: @response, status: :ok and return
                if @response == "170"
                  @response = {
                    message: {
                      text: "호빗이네 몸무겐?"
                    },
                    keyboard: {
                      type: "buttons",
                      buttons: ["60", "70"]
                    }
                  }
                  render json: @response, status: :ok 
                    if @response == "60"
                      @response = {
                        message: {
                          text: "good 완벽남"
                        },
                        keyboard: {
                    type: "buttons",
                    buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                  }
                      }
                      render json: @response, status: :ok 
                    else @response =="70"
                      @response = {
                        message: {
                          text: "pig"
                        }
                      }
                      render json: @response, status: :ok 
                    end
                    
                else @response == "180"
                  @response = {
                    message: {
                      text: "올 좀큰데? 몸무겐?"
                    },
                    keyboard: {
                      type: "buttons",
                      buttons: ["60", "70"]
                    }
                  }
                  render json: @response, status: :ok 
                  if @response == "60"
                      @response = {
                        message: {
                          text: "good 완벽남"
                        }
                      }
                      render json: @response, status: :ok 
                    else @response =="70"
                      @response = {
                        message: {
                          text: "pig"
                        }
                      }
                      render json: @response, status: :ok 
                  end
                  render json: @response, status: :ok 
                end
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