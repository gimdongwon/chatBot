class UsersController < ApplicationController
    def keyboard_init
        @msg =
            {
              type: "buttons",
              buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
            }
        render json: @msg, status: :ok 
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

             if @response == "나에게 가장 잘맞는 청바지추천"
                @response = {
                  message: {
                      text: "#{@user.name}님이 나에게 가장 잘맞는 청바지추천을 누르셨습니다. 추천서비스를 위해 간단한 설문을 진행하겠습니다 #{@user.name}님의 키는 어느 정도인가요?."
                  },
                  keyboard: {
                    type: "buttons",

                    buttons: ["청바지-165이하", "청바지-166~170", "청바지-171~175", "청바지-176~180", "청바지-181~185","청바지-186이상"]
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
                #제현이 부분 시작

                #1차 갈래                
                elsif @response == "청바지-165이하"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-165이하-50kg이하", "청바지-165이하-51kg~60kg", "청바지-165이하-61kg~70kg", "청바지-165이하-71kg~80kg", "청바지-165이하-81kg~90kg", "청바지-165이하-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지-166~170"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-166~170-50kg이하", "청바지-166~170-51kg~60kg", "청바지-166~170-61kg~70kg", "청바지-166~170-71kg~80kg", "청바지-166~170-81kg~90kg", "청바지-166~170-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지-171~175"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-171~175-50kg이하", "청바지-171~175-51kg~60kg", "청바지-171~175-61kg~70kg", "청바지-171~175-71kg~80kg", "청바지-171~175-81kg~90kg", "청바지-171~175-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지-176~180"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-176~180-50kg이하", "청바지-176~180-51kg~60kg", "청바지-176~180-61kg~70kg", "청바지-176~180-71kg~80kg", "청바지-176~180-81kg~90kg", "청바지-176~180-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지-181~185"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-181~185-50kg이하", "청바지-181~185-51kg~60kg", "청바지-181~185-61kg~70kg", "청바지-181~185-71kg~80kg", "청바지-181~185-81kg~90kg", "청바지-181~185-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                elsif @response == "청바지-186이상"
                      @response = {
                        message: {
                            text: "#{@user.name}님의 몸무게는 어느 정도인가요?."
                        },
                        keyboard: {
                          type: "buttons",
                          buttons: ["청바지-186이상-50kg이하", "청바지-186이상-51kg~60kg", "청바지-186이상-61kg~70kg", "청바지-186이상-71kg~80kg", "청바지-186이상-81kg~90kg", "청바지-186이상-91kg이상"]
                        }
                      }
                          render json: @response, status: :ok
                      
                        # 청바지 키- 몸무게
                        # 2차갈래


                                    elsif @response == "청바지-165이하-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-50kg이하-28이하", "청바지-165이하-50kg이하-29", "청바지-165이하-50kg이하-30", "청바지-165이하-50kg이하-31", "청바지-165이하-50kg이하-32", "청바지-165이하-50kg이하-33", "청바지-165이하-50kg이하-34", "청바지-165이하-50kg이하-35", "청바지-165이하-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-166~170-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-50kg이하-28이하", "청바지-166~170-50kg이하-29", "청바지-166~170-50kg이하-30", "청바지-166~170-50kg이하-31", "청바지-166~170-50kg이하-32", "청바지-166~170-50kg이하-33", "청바지-166~170-50kg이하-34", "청바지-166~170-50kg이하-35", "청바지-166~170-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-50kg이하-28이하", "청바지-171~175-50kg이하-29", "청바지-171~175-50kg이하-30", "청바지-171~175-50kg이하-31", "청바지-171~175-50kg이하-32", "청바지-171~175-50kg이하-33", "청바지-171~175-50kg이하-34", "청바지-171~175-50kg이하-35", "청바지-171~175-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok

                                    elsif @response == "청바지-176~180-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-50kg이하-28이하", "청바지-176~180-50kg이하-29", "청바지-176~180-50kg이하-30", "청바지-176~180-50kg이하-31", "청바지-176~180-50kg이하-32", "청바지-176~180-50kg이하-33", "청바지-176~180-50kg이하-34", "청바지-176~180-50kg이하-35", "청바지-176~180-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok

                                    elsif @response == "청바지-181~185-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-50kg이하-28이하", "청바지-181~185-50kg이하-29", "청바지-181~185-50kg이하-30", "청바지-181~185-50kg이하-31", "청바지-181~185-50kg이하-32", "청바지-181~185-50kg이하-33", "청바지-181~185-50kg이하-34", "청바지-181~185-50kg이하-35", "청바지-181~185-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-50kg이하"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-50kg이하-28이하", "청바지-186이상-50kg이하-29", "청바지-186이상-50kg이하-30", "청바지-186이상-50kg이하-31", "청바지-186이상-50kg이하-32", "청바지-186이상-50kg이하-33", "청바지-186이상-50kg이하-34", "청바지-186이상-50kg이하-35", "청바지-186이상-50kg이하-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-165이하-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-51kg~60kg-28이하", "청바지-165이하-51kg~60kg-29", "청바지-165이하-51kg~60kg-30", "청바지-165이하-51kg~60kg-31", "청바지-165이하-51kg~60kg-32", "청바지-165이하-51kg~60kg-33", "청바지-165이하-51kg~60kg-34", "청바지-165이하-51kg~60kg-35", "청바지-165이하-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-165이하-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-61kg~70kg-28이하", "청바지-165이하-61kg~70kg-29", "청바지-165이하-61kg~70kg-30", "청바지-165이하-61kg~70kg-31", "청바지-165이하-61kg~70kg-32", "청바지-165이하-61kg~70kg-33", "청바지-165이하-61kg~70kg-34", "청바지-165이하-61kg~70kg-35", "청바지-165이하-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-165이하-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-71kg~80kg-28이하", "청바지-165이하-71kg~80kg-29", "청바지-165이하-71kg~80kg-30", "청바지-165이하-71kg~80kg-31", "청바지-165이하-71kg~80kg-32", "청바지-165이하-71kg~80kg-33", "청바지-165이하-71kg~80kg-34", "청바지-165이하-71kg~80kg-35", "청바지-165이하-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-165이하-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-81kg~90kg-28이하", "청바지-165이하-81kg~90kg-29", "청바지-165이하-81kg~90kg-30", "청바지-165이하-81kg~90kg-31", "청바지-165이하-81kg~90kg-32", "청바지-165이하-81kg~90kg-33", "청바지-165이하-81kg~90kg-34", "청바지-165이하-81kg~90kg-35", "청바지-165이하-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-165이하-91kg이상"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-165이하-91kg이상-28이하", "청바지-165이하-91kg이상-29", "청바지-165이하-91kg이상-30", "청바지-165이하-91kg이상-31", "청바지-165이하-91kg이상-32", "청바지-165이하-91kg이상-33", "청바지-165이하-91kg이상-34", "청바지-165이하-91kg이상-35", "청바지-165이하-91kg이상-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    
                                    elsif @response == "청바지-166~170-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-51kg~60kg-28이하", "청바지-166~170-51kg~60kg-29", "청바지-166~170-51kg~60kg-30", "청바지-166~170-51kg~60kg-31", "청바지-166~170-51kg~60kg-32", "청바지-166~170-51kg~60kg-33", "청바지-166~170-51kg~60kg-34", "청바지-166~170-51kg~60kg-35", "청바지-166~170-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-166~170-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-61kg~70kg-28이하", "청바지-166~170-61kg~70kg-29", "청바지-166~170-61kg~70kg-30", "청바지-166~170-61kg~70kg-31", "청바지-166~170-61kg~70kg-32", "청바지-166~170-61kg~70kg-33", "청바지-166~170-61kg~70kg-34", "청바지-166~170-61kg~70kg-35", "청바지-166~170-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-166~170-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-71kg~80kg-28이하", "청바지-166~170-71kg~80kg-29", "청바지-166~170-71kg~80kg-30", "청바지-166~170-71kg~80kg-31", "청바지-166~170-71kg~80kg-32", "청바지-166~170-71kg~80kg-33", "청바지-166~170-71kg~80kg-34", "청바지-166~170-71kg~80kg-35", "청바지-166~170-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-166~170-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-81kg~90kg-28이하", "청바지-166~170-81kg~90kg-29", "청바지-166~170-81kg~90kg-30", "청바지-166~170-81kg~90kg-31", "청바지-166~170-81kg~90kg-32", "청바지-166~170-81kg~90kg-33", "청바지-166~170-81kg~90kg-34", "청바지-166~170-81kg~90kg-35", "청바지-166~170-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-166~170-91kg이상"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-166~170-91kg이상-28이하", "청바지-166~170-91kg이상-29", "청바지-166~170-91kg이상-30", "청바지-166~170-91kg이상-31", "청바지-166~170-91kg이상-32", "청바지-166~170-91kg이상-33", "청바지-166~170-91kg이상-34", "청바지-166~170-91kg이상-35", "청바지-166~170-91kg이상-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-51kg~60kg-28이하", "청바지-171~175-51kg~60kg-29", "청바지-171~175-51kg~60kg-30", "청바지-171~175-51kg~60kg-31", "청바지-171~175-51kg~60kg-32", "청바지-171~175-51kg~60kg-33", "청바지-171~175-51kg~60kg-34", "청바지-171~175-51kg~60kg-35", "청바지-171~175-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-61kg~70kg-28이하", "청바지-171~175-61kg~70kg-29", "청바지-171~175-61kg~70kg-30", "청바지-171~175-61kg~70kg-31", "청바지-171~175-61kg~70kg-32", "청바지-171~175-61kg~70kg-33", "청바지-171~175-61kg~70kg-34", "청바지-171~175-61kg~70kg-35", "청바지-171~175-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-71kg~80kg-28이하", "청바지-171~175-71kg~80kg-29", "청바지-171~175-71kg~80kg-30", "청바지-171~175-71kg~80kg-31", "청바지-171~175-71kg~80kg-32", "청바지-171~175-71kg~80kg-33", "청바지-171~175-71kg~80kg-34", "청바지-171~175-71kg~80kg-35", "청바지-171~175-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-81kg~90kg-28이하", "청바지-171~175-81kg~90kg-29", "청바지-171~175-81kg~90kg-30", "청바지-171~175-81kg~90kg-31", "청바지-171~175-81kg~90kg-32", "청바지-171~175-81kg~90kg-33", "청바지-171~175-81kg~90kg-34", "청바지-171~175-81kg~90kg-35", "청바지-171~175-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-171~175-91kg이상"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-171~175-91kg이상-28이하", "청바지-171~175-91kg이상-29", "청바지-171~175-91kg이상-30", "청바지-171~175-91kg이상-31", "청바지-171~175-91kg이상-32", "청바지-171~175-91kg이상-33", "청바지-171~175-91kg이상-34", "청바지-171~175-91kg이상-35", "청바지-171~175-91kg이상-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok

                                    elsif @response == "청바지-176~180-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-51kg~60kg-28이하", "청바지-176~180-51kg~60kg-29", "청바지-176~180-51kg~60kg-30", "청바지-176~180-51kg~60kg-31", "청바지-176~180-51kg~60kg-32", "청바지-176~180-51kg~60kg-33", "청바지-176~180-51kg~60kg-34", "청바지-176~180-51kg~60kg-35", "청바지-176~180-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-176~180-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-61kg~70kg-28이하", "청바지-176~180-61kg~70kg-29", "청바지-176~180-61kg~70kg-30", "청바지-176~180-61kg~70kg-31", "청바지-176~180-61kg~70kg-32", "청바지-176~180-61kg~70kg-33", "청바지-176~180-61kg~70kg-34", "청바지-176~180-61kg~70kg-35", "청바지-176~180-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-176~180-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-71kg~80kg-28이하", "청바지-176~180-71kg~80kg-29", "청바지-176~180-71kg~80kg-30", "청바지-176~180-71kg~80kg-31", "청바지-176~180-71kg~80kg-32", "청바지-176~180-71kg~80kg-33", "청바지-176~180-71kg~80kg-34", "청바지-176~180-71kg~80kg-35", "청바지-176~180-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-176~180-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-81kg~90kg-28이하", "청바지-176~180-81kg~90kg-29", "청바지-176~180-81kg~90kg-30", "청바지-176~180-81kg~90kg-31", "청바지-176~180-81kg~90kg-32", "청바지-176~180-81kg~90kg-33", "청바지-176~180-81kg~90kg-34", "청바지-176~180-81kg~90kg-35", "청바지-176~180-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-176~180-91kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-176~180-91kg-28이하", "청바지-176~180-91kg-29", "청바지-176~180-91kg-30", "청바지-176~180-91kg-31", "청바지-176~180-91kg-32", "청바지-176~180-91kg-33", "청바지-176~180-91kg-34", "청바지-176~180-91kg-35", "청바지-176~180-91kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-181~185-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-51kg~60kg-28이하", "청바지-181~185-51kg~60kg-29", "청바지-181~185-51kg~60kg-30", "청바지-181~185-51kg~60kg-31", "청바지-181~185-51kg~60kg-32", "청바지-181~185-51kg~60kg-33", "청바지-181~185-51kg~60kg-34", "청바지-181~185-51kg~60kg-35", "청바지-181~185-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-181~185-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-61kg~70kg-28이하", "청바지-181~185-61kg~70kg-29", "청바지-181~185-61kg~70kg-30", "청바지-181~185-61kg~70kg-31", "청바지-181~185-61kg~70kg-32", "청바지-181~185-61kg~70kg-33", "청바지-181~185-61kg~70kg-34", "청바지-181~185-61kg~70kg-35", "청바지-181~185-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-181~185-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-71kg~80kg-28이하", "청바지-181~185-71kg~80kg-29", "청바지-181~185-71kg~80kg-30", "청바지-181~185-71kg~80kg-31", "청바지-181~185-71kg~80kg-32", "청바지-181~185-71kg~80kg-33", "청바지-181~185-71kg~80kg-34", "청바지-181~185-71kg~80kg-35", "청바지-181~185-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-181~185-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-81kg~90kg-28이하", "청바지-181~185-81kg~90kg-29", "청바지-181~185-81kg~90kg-30", "청바지-181~185-81kg~90kg-31", "청바지-181~185-81kg~90kg-32", "청바지-181~185-81kg~90kg-33", "청바지-181~185-81kg~90kg-34", "청바지-181~185-81kg~90kg-35", "청바지-181~185-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-181~185-91kg이상"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-181~185-91kg이상-28이하", "청바지-181~185-91kg이상-29", "청바지-181~185-91kg이상-30", "청바지-181~185-91kg이상-31", "청바지-181~185-91kg이상-32", "청바지-181~185-91kg이상-33", "청바지-181~185-91kg이상-34", "청바지-181~185-91kg이상-35", "청바지-181~185-91kg이상-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-51kg~60kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-51kg~60kg-28이하", "청바지-186이상-51kg~60kg-29", "청바지-186이상-51kg~60kg-30", "청바지-186이상-51kg~60kg-31", "청바지-186이상-51kg~60kg-32", "청바지-186이상-51kg~60kg-33", "청바지-186이상-51kg~60kg-34", "청바지-186이상-51kg~60kg-35", "청바지-186이상-51kg~60kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-61kg~70kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-61kg~70kg-28이하", "청바지-186이상-61kg~70kg-29", "청바지-186이상-61kg~70kg-30", "청바지-186이상-61kg~70kg-31", "청바지-186이상-61kg~70kg-32", "청바지-186이상-61kg~70kg-33", "청바지-186이상-61kg~70kg-34", "청바지-186이상-61kg~70kg-35", "청바지-186이상-61kg~70kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-71kg~80kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-71kg~80kg-28이하", "청바지-186이상-71kg~80kg-29", "청바지-186이상-71kg~80kg-30", "청바지-186이상-71kg~80kg-31", "청바지-186이상-71kg~80kg-32", "청바지-186이상-71kg~80kg-33", "청바지-186이상-71kg~80kg-34", "청바지-186이상-71kg~80kg-35", "청바지-186이상-71kg~80kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-81kg~90kg"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-81kg~90kg-28이하", "청바지-186이상-81kg~90kg-29", "청바지-186이상-81kg~90kg-30", "청바지-186이상-81kg~90kg-31", "청바지-186이상-81kg~90kg-32", "청바지-186이상-81kg~90kg-33", "청바지-186이상-81kg~90kg-34", "청바지-186이상-81kg~90kg-35", "청바지-186이상-81kg~90kg-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                    elsif @response == "청바지-186이상-91kg이상"
                                          @response = {
                                            message: {
                                                text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                            },
                                            keyboard: {
                                              type: "buttons",
                                              buttons: ["청바지-186이상-91kg이상-28이하", "청바지-186이상-91kg이상-29", "청바지-186이상-91kg이상-30", "청바지-186이상-91kg이상-31", "청바지-186이상-91kg이상-32", "청바지-186이상-91kg이상-33", "청바지-186이상-91kg이상-34", "청바지-186이상-91kg이상-35", "청바지-186이상-91kg이상-36이상"]
                                            }
                                          }
                                              render json: @response, status: :ok
                                                          # 핏 시작




                                                          elsif @response == "청바지-165이하-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-28이하-스키니핏", "청바지-165이하-50kg이하-28이하-슬림 스트레이트핏", "청바지-165이하-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-29-스키니핏", "청바지-165이하-50kg이하-29-슬림 스트레이트핏", "청바지-165이하-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-30-스키니핏", "청바지-165이하-50kg이하-30-슬림 스트레이트핏", "청바지-165이하-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-31-스키니핏", "청바지-165이하-50kg이하-31-슬림 스트레이트핏", "청바지-165이하-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-32-스키니핏", "청바지-165이하-50kg이하-32-슬림 스트레이트핏", "청바지-165이하-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-33-스키니핏", "청바지-165이하-50kg이하-33-슬림 스트레이트핏", "청바지-165이하-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-34-스키니핏", "청바지-165이하-50kg이하-34-슬림 스트레이트핏", "청바지-165이하-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-35-스키니핏", "청바지-165이하-50kg이하-35-슬림 스트레이트핏", "청바지-165이하-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-50kg이하-36이상-스키니핏", "청바지-165이하-50kg이하-36이상-슬림 스트레이트핏", "청바지-165이하-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-165이하-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-28이하-스키니핏", "청바지-165이하-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-29-스키니핏", "청바지-165이하-51kg~60kg-29-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-30-스키니핏", "청바지-165이하-51kg~60kg-30-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-31-스키니핏", "청바지-165이하-51kg~60kg-31-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-32-스키니핏", "청바지-165이하-51kg~60kg-32-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-33-스키니핏", "청바지-165이하-51kg~60kg-33-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-34-스키니핏", "청바지-165이하-51kg~60kg-34-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-35-스키니핏", "청바지-165이하-51kg~60kg-35-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-51kg~60kg-36이상-스키니핏", "청바지-165이하-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-165이하-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-165이하-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-28이하-스키니핏", "청바지-165이하-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-29-스키니핏", "청바지-165이하-61kg~70kg-29-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-30-스키니핏", "청바지-165이하-61kg~70kg-30-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-31-스키니핏", "청바지-165이하-61kg~70kg-31-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-32-스키니핏", "청바지-165이하-61kg~70kg-32-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-33-스키니핏", "청바지-165이하-61kg~70kg-33-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-34-스키니핏", "청바지-165이하-61kg~70kg-34-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-35-스키니핏", "청바지-165이하-61kg~70kg-35-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-61kg~70kg-36이상-스키니핏", "청바지-165이하-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-165이하-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-165이하-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-28이하-스키니핏", "청바지-165이하-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-29-스키니핏", "청바지-165이하-71kg~80kg-29-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-30-스키니핏", "청바지-165이하-71kg~80kg-30-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-31-스키니핏", "청바지-165이하-71kg~80kg-31-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-32-스키니핏", "청바지-165이하-71kg~80kg-32-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-33-스키니핏", "청바지-165이하-71kg~80kg-33-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-34-스키니핏", "청바지-165이하-71kg~80kg-34-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-35-스키니핏", "청바지-165이하-71kg~80kg-35-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-71kg~80kg-36이상-스키니핏", "청바지-165이하-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-165이하-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-165이하-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-28이하-스키니핏", "청바지-165이하-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-29-스키니핏", "청바지-165이하-81kg~90kg-29-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-30-스키니핏", "청바지-165이하-81kg~90kg-30-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-31-스키니핏", "청바지-165이하-81kg~90kg-31-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-32-스키니핏", "청바지-165이하-81kg~90kg-32-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-33-스키니핏", "청바지-165이하-81kg~90kg-33-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-34-스키니핏", "청바지-165이하-81kg~90kg-34-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-35-스키니핏", "청바지-165이하-81kg~90kg-35-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-81kg~90kg-36이상-스키니핏", "청바지-165이하-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-165이하-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-165이하-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-28이하-스키니핏", "청바지-165이하-91kg이상-28이하-슬림 스트레이트핏", "청바지-165이하-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-29-스키니핏", "청바지-165이하-91kg이상-29-슬림 스트레이트핏", "청바지-165이하-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-30-스키니핏", "청바지-165이하-91kg이상-30-슬림 스트레이트핏", "청바지-165이하-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-31-스키니핏", "청바지-165이하-91kg이상-31-슬림 스트레이트핏", "청바지-165이하-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-165이하-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-32-스키니핏", "청바지-165이하-91kg이상-32-슬림 스트레이트핏", "청바지-165이하-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-33-스키니핏", "청바지-165이하-91kg이상-33-슬림 스트레이트핏", "청바지-165이하-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-34-스키니핏", "청바지-165이하-91kg이상-34-슬림 스트레이트핏", "청바지-165이하-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-35-스키니핏", "청바지-165이하-91kg이상-35-슬림 스트레이트핏", "청바지-165이하-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-165이하-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-165이하-91kg이상-36이상-스키니핏", "청바지-165이하-91kg이상-36이상-슬림 스트레이트핏", "청바지-165이하-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          
                                                          elsif @response == "청바지-166~170-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-28이하-스키니핏", "청바지-166~170-50kg이하-28이하-슬림 스트레이트핏", "청바지-166~170-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-29-스키니핏", "청바지-166~170-50kg이하-29-슬림 스트레이트핏", "청바지-166~170-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-30-스키니핏", "청바지-166~170-50kg이하-30-슬림 스트레이트핏", "청바지-166~170-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-31-스키니핏", "청바지-166~170-50kg이하-31-슬림 스트레이트핏", "청바지-166~170-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-32-스키니핏", "청바지-166~170-50kg이하-32-슬림 스트레이트핏", "청바지-166~170-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-33-스키니핏", "청바지-166~170-50kg이하-33-슬림 스트레이트핏", "청바지-166~170-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-34-스키니핏", "청바지-166~170-50kg이하-34-슬림 스트레이트핏", "청바지-166~170-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-35-스키니핏", "청바지-166~170-50kg이하-35-슬림 스트레이트핏", "청바지-166~170-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-50kg이하-36이상-스키니핏", "청바지-166~170-50kg이하-36이상-슬림 스트레이트핏", "청바지-166~170-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-166~170-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-28이하-스키니핏", "청바지-166~170-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-29-스키니핏", "청바지-166~170-51kg~60kg-29-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-30-스키니핏", "청바지-166~170-51kg~60kg-30-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-31-스키니핏", "청바지-166~170-51kg~60kg-31-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-32-스키니핏", "청바지-166~170-51kg~60kg-32-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-33-스키니핏", "청바지-166~170-51kg~60kg-33-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-34-스키니핏", "청바지-166~170-51kg~60kg-34-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-35-스키니핏", "청바지-166~170-51kg~60kg-35-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-51kg~60kg-36이상-스키니핏", "청바지-166~170-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-166~170-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-166~170-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-28이하-스키니핏", "청바지-166~170-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-29-스키니핏", "청바지-166~170-61kg~70kg-29-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-30-스키니핏", "청바지-166~170-61kg~70kg-30-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-31-스키니핏", "청바지-166~170-61kg~70kg-31-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-32-스키니핏", "청바지-166~170-61kg~70kg-32-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-33-스키니핏", "청바지-166~170-61kg~70kg-33-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-34-스키니핏", "청바지-166~170-61kg~70kg-34-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-35-스키니핏", "청바지-166~170-61kg~70kg-35-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-61kg~70kg-36이상-스키니핏", "청바지-166~170-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-166~170-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-166~170-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-28이하-스키니핏", "청바지-166~170-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-29-스키니핏", "청바지-166~170-71kg~80kg-29-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-30-스키니핏", "청바지-166~170-71kg~80kg-30-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-31-스키니핏", "청바지-166~170-71kg~80kg-31-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-32-스키니핏", "청바지-166~170-71kg~80kg-32-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-33-스키니핏", "청바지-166~170-71kg~80kg-33-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-34-스키니핏", "청바지-166~170-71kg~80kg-34-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-35-스키니핏", "청바지-166~170-71kg~80kg-35-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-71kg~80kg-36이상-스키니핏", "청바지-166~170-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-166~170-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-166~170-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-28이하-스키니핏", "청바지-166~170-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-29-스키니핏", "청바지-166~170-81kg~90kg-29-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-30-스키니핏", "청바지-166~170-81kg~90kg-30-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-31-스키니핏", "청바지-166~170-81kg~90kg-31-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-32-스키니핏", "청바지-166~170-81kg~90kg-32-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-33-스키니핏", "청바지-166~170-81kg~90kg-33-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-34-스키니핏", "청바지-166~170-81kg~90kg-34-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-35-스키니핏", "청바지-166~170-81kg~90kg-35-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-81kg~90kg-36이상-스키니핏", "청바지-166~170-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-166~170-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-166~170-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-28이하-스키니핏", "청바지-166~170-91kg이상-28이하-슬림 스트레이트핏", "청바지-166~170-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-29-스키니핏", "청바지-166~170-91kg이상-29-슬림 스트레이트핏", "청바지-166~170-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-30-스키니핏", "청바지-166~170-91kg이상-30-슬림 스트레이트핏", "청바지-166~170-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-31-스키니핏", "청바지-166~170-91kg이상-31-슬림 스트레이트핏", "청바지-166~170-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-166~170-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-32-스키니핏", "청바지-166~170-91kg이상-32-슬림 스트레이트핏", "청바지-166~170-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-33-스키니핏", "청바지-166~170-91kg이상-33-슬림 스트레이트핏", "청바지-166~170-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-34-스키니핏", "청바지-166~170-91kg이상-34-슬림 스트레이트핏", "청바지-166~170-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-35-스키니핏", "청바지-166~170-91kg이상-35-슬림 스트레이트핏", "청바지-166~170-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-166~170-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-166~170-91kg이상-36이상-스키니핏", "청바지-166~170-91kg이상-36이상-슬림 스트레이트핏", "청바지-166~170-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok

                                                          elsif @response == "청바지-171~175-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-28이하-스키니핏", "청바지-171~175-50kg이하-28이하-슬림 스트레이트핏", "청바지-171~175-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-29-스키니핏", "청바지-171~175-50kg이하-29-슬림 스트레이트핏", "청바지-171~175-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-30-스키니핏", "청바지-171~175-50kg이하-30-슬림 스트레이트핏", "청바지-171~175-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-31-스키니핏", "청바지-171~175-50kg이하-31-슬림 스트레이트핏", "청바지-171~175-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-32-스키니핏", "청바지-171~175-50kg이하-32-슬림 스트레이트핏", "청바지-171~175-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-33-스키니핏", "청바지-171~175-50kg이하-33-슬림 스트레이트핏", "청바지-171~175-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-34-스키니핏", "청바지-171~175-50kg이하-34-슬림 스트레이트핏", "청바지-171~175-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-35-스키니핏", "청바지-171~175-50kg이하-35-슬림 스트레이트핏", "청바지-171~175-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-50kg이하-36이상-스키니핏", "청바지-171~175-50kg이하-36이상-슬림 스트레이트핏", "청바지-171~175-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-171~175-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-28이하-스키니핏", "청바지-171~175-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-29-스키니핏", "청바지-171~175-51kg~60kg-29-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-30-스키니핏", "청바지-171~175-51kg~60kg-30-슬림스트레이트핏", "청바지-171~175-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-31-스키니핏", "청바지-171~175-51kg~60kg-31-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-32-스키니핏", "청바지-171~175-51kg~60kg-32-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세���"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-33-스키니핏", "청바지-171~175-51kg~60kg-33-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-34-스키니핏", "청바지-171~175-51kg~60kg-34-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-35-스키니핏", "청바지-171~175-51kg~60kg-35-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-51kg~60kg-36이상-스키니핏", "청바지-171~175-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-171~175-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-171~175-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-28이하-스키니핏", "청바지-171~175-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-29-스키니핏", "청바지-171~175-61kg~70kg-29-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-30-스키니핏", "청바지-171~175-61kg~70kg-30-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-31-스키니핏", "청바지-171~175-61kg~70kg-31-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-32-스키니핏", "청바지-171~175-61kg~70kg-32-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-33-스키니핏", "청바지-171~175-61kg~70kg-33-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-34-스키니핏", "청바지-171~175-61kg~70kg-34-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-35-스키니핏", "청바지-171~175-61kg~70kg-35-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-61kg~70kg-36이상-스키니핏", "청바지-171~175-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-171~175-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-171~175-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-28이하-스키니핏", "청바지-171~175-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-29-스키니핏", "청바지-171~175-71kg~80kg-29-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-30-스키니핏", "청바지-171~175-71kg~80kg-30-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-31-스키니핏", "청바지-171~175-71kg~80kg-31-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-32-스키니핏", "청바지-171~175-71kg~80kg-32-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-33-스키니핏", "청바지-171~175-71kg~80kg-33-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-34-스키니핏", "청바지-171~175-71kg~80kg-34-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-35-스키니핏", "청바지-171~175-71kg~80kg-35-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-71kg~80kg-36이상-스키니핏", "청바지-171~175-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-171~175-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-171~175-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-28이하-스키니핏", "청바지-171~175-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-29-스키니핏", "청바지-171~175-81kg~90kg-29-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-30-스키니핏", "청바지-171~175-81kg~90kg-30-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-31-스키니핏", "청바지-171~175-81kg~90kg-31-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-32-스키니핏", "청바지-171~175-81kg~90kg-32-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-33-스키니핏", "청바지-171~175-81kg~90kg-33-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-34-스키니핏", "청바지-171~175-81kg~90kg-34-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-35-스키니핏", "청바지-171~175-81kg~90kg-35-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-81kg~90kg-36이상-스키니핏", "청바지-171~175-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-171~175-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-171~175-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-28이하-스키니핏", "청바지-171~175-91kg이상-28이하-슬림 스트레이트핏", "청바지-171~175-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-29-스키니핏", "청바지-171~175-91kg이상-29-슬림 스트레이트핏", "청바지-171~175-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-30-스키니핏", "청바지-171~175-91kg이상-30-슬림 스트레이트핏", "청바지-171~175-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-31-스키니핏", "청바지-171~175-91kg이상-31-슬림 스트레이트핏", "청바지-171~175-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-171~175-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-32-스키니핏", "청바지-171~175-91kg이상-32-슬림 스트레이트핏", "청바지-171~175-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-33-스키니핏", "청바지-171~175-91kg이상-33-슬림 스트레이트핏", "청바지-171~175-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-34-스키니핏", "청바지-171~175-91kg이상-34-슬림 스트레이트핏", "청바지-171~175-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-35-스키니핏", "청바지-171~175-91kg이상-35-슬림 스트레이트핏", "청바지-171~175-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-171~175-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-171~175-91kg이상-36이상-스키니핏", "청바지-171~175-91kg이상-36이상-슬림 스트레이트핏", "청바지-171~175-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok

                                                          elsif @response == "청바지-176~180-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-28이하-스키니핏", "청바지-176~180-50kg이하-28이하-슬림 스트레이트핏", "청바지-176~180-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-29-스키니핏", "청바지-176~180-50kg이하-29-슬림 스트레이트핏", "청바지-176~180-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-30-스키니핏", "청바지-176~180-50kg이하-30-슬림 스트레이트핏", "청바지-176~180-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-31-스키니핏", "청바지-176~180-50kg이하-31-슬림 스트레이트핏", "청바지-176~180-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-32-스키니핏", "청바지-176~180-50kg이하-32-슬림 스트레이트핏", "청바지-176~180-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-33-스키니핏", "청바지-176~180-50kg이하-33-슬림 스트레이트핏", "청바지-176~180-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-34-스키니핏", "청바지-176~180-50kg이하-34-슬림 스트레이트핏", "청바지-176~180-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-35-스키니핏", "청바지-176~180-50kg이하-35-슬림 스트레이트핏", "청바지-176~180-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-50kg이하-36이상-스키니핏", "청바지-176~180-50kg이하-36이상-슬림 스트레이트핏", "청바지-176~180-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-176~180-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-28이하-스키니핏", "청바지-176~180-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-29-스키니핏", "청바지-176~180-51kg~60kg-29-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-30-스키니핏", "청바지-176~180-51kg~60kg-30-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-31-스키니핏", "청바지-176~180-51kg~60kg-31-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-32-스키니핏", "청바지-176~180-51kg~60kg-32-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-33-스키니핏", "청바지-176~180-51kg~60kg-33-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-34-스키니핏", "청바지-176~180-51kg~60kg-34-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-35-스키니핏", "청바지-176~180-51kg~60kg-35-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-51kg~60kg-36이상-스키니핏", "청바지-176~180-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-176~180-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-176~180-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-28이하-스키니핏", "청바지-176~180-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-29-스키니핏", "청바지-176~180-61kg~70kg-29-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-30-스키니핏", "청바지-176~180-61kg~70kg-30-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-31-스키니핏", "청바지-176~180-61kg~70kg-31-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-32-스키니핏", "청바지-176~180-61kg~70kg-32-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-33-스키니핏", "청바지-176~180-61kg~70kg-33-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-34-스키니핏", "청바지-176~180-61kg~70kg-34-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-35-스키니핏", "청바지-176~180-61kg~70kg-35-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-61kg~70kg-36이상-스키니핏", "청바지-176~180-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-176~180-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-176~180-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-28이하-스키니핏", "청바지-176~180-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-29-스키니핏", "청바지-176~180-71kg~80kg-29-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-30-스키니핏", "청바지-176~180-71kg~80kg-30-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-31-스키니핏", "청바지-176~180-71kg~80kg-31-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-32-스키니핏", "청바지-176~180-71kg~80kg-32-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-33-스키니핏", "청바지-176~180-71kg~80kg-33-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-34-스키니핏", "청바지-176~180-71kg~80kg-34-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-35-스키니핏", "청바지-176~180-71kg~80kg-35-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-71kg~80kg-36이상-스키니핏", "청바지-176~180-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-176~180-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-176~180-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-28이하-스키니핏", "청바지-176~180-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-29-스키니핏", "청바지-176~180-81kg~90kg-29-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-30-스키니핏", "청바지-176~180-81kg~90kg-30-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-31-스키니핏", "청바지-176~180-81kg~90kg-31-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-32-스키니핏", "청바지-176~180-81kg~90kg-32-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-33-스키니핏", "청바지-176~180-81kg~90kg-33-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-34-스키니핏", "청바지-176~180-81kg~90kg-34-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-35-스키니핏", "청바지-176~180-81kg~90kg-35-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-81kg~90kg-36이상-스키니핏", "청바지-176~180-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-176~180-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-176~180-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-28이하-스키니핏", "청바지-176~180-91kg이상-28이하-슬림 스트레이트핏", "청바지-176~180-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-29-스키니핏", "청바지-176~180-91kg이상-29-슬림 스트레이트핏", "청바지-176~180-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-30-스키니핏", "청바지-176~180-91kg이상-30-슬림 스트레이트핏", "청바지-176~180-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-31-스키니핏", "청바지-176~180-91kg이상-31-슬림 스트레이트핏", "청바지-176~180-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-176~180-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-32-스키니핏", "청바지-176~180-91kg이상-32-슬림 스트레이트핏", "청바지-176~180-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-33-스키니핏", "청바지-176~180-91kg이상-33-슬림 스트레이트핏", "청바지-176~180-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-34-스키니핏", "청바지-176~180-91kg이상-34-슬림 스트레이트핏", "청바지-176~180-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-35-스키니핏", "청바지-176~180-91kg이상-35-슬림 스트레이트핏", "청바지-176~180-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-176~180-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-176~180-91kg이상-36이상-스키니핏", "청바지-176~180-91kg이상-36이상-슬림 스트레이트핏", "청바지-176~180-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          

                                                                  # 181~185
                                                          elsif @response == "청바지-181~185-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-28이하-스키니핏", "청바지-181~185-50kg이하-28이하-슬림 스트레이트핏", "청바지-181~185-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-29-스키니핏", "청바지-181~185-50kg이하-29-슬림 스트레이트핏", "청바지-181~185-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-30-스키니핏", "청바지-181~185-50kg이하-30-슬림 스트레이트핏", "청바지-181~185-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-31-스키니핏", "청바지-181~185-50kg이하-31-슬림 스트레이트핏", "청바지-181~185-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-32-스키니핏", "청바지-181~185-50kg이하-32-슬림 스트레이트핏", "청바지-181~185-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-33-스키니핏", "청바지-181~185-50kg이하-33-슬림 스트레이트핏", "청바지-181~185-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-34-스키니핏", "청바지-181~185-50kg이하-34-슬림 스트레이트핏", "청바지-181~185-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-35-스키니핏", "청바지-181~185-50kg이하-35-슬림 스트레이트핏", "청바지-181~185-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-50kg이하-36이상-스키니핏", "청바지-181~185-50kg이하-36이상-슬림 스트레이트핏", "청바지-181~185-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-181~185-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-28이하-스키니핏", "청바지-181~185-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-29-스키니핏", "청바지-181~185-51kg~60kg-29-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-30-스키니핏", "청바지-181~185-51kg~60kg-30-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-31-스키니핏", "청바지-181~185-51kg~60kg-31-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-32-스키니핏", "청바지-181~185-51kg~60kg-32-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-33-스키니핏", "청바지-181~185-51kg~60kg-33-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-34-스키니핏", "청바지-181~185-51kg~60kg-34-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-35-스키니핏", "청바지-181~185-51kg~60kg-35-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-51kg~60kg-36이상-스키니핏", "청바지-181~185-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-181~185-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-181~185-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-28이하-스키니핏", "청바지-181~185-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-29-스키니핏", "청바지-181~185-61kg~70kg-29-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-30-스키니핏", "청바지-181~185-61kg~70kg-30-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-31-스키니핏", "청바지-181~185-61kg~70kg-31-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-32-스키니핏", "청바지-181~185-61kg~70kg-32-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-33-스키니핏", "청바지-181~185-61kg~70kg-33-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-34-스키니핏", "청바지-181~185-61kg~70kg-34-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-35-스키니핏", "청바지-181~185-61kg~70kg-35-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-61kg~70kg-36이상-스키니핏", "청바지-181~185-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-181~185-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-181~185-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-28이하-스키니핏", "청바지-181~185-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-29-스키니핏", "청바지-181~185-71kg~80kg-29-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-30-스키니핏", "청바지-181~185-71kg~80kg-30-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-31-스키니핏", "청바지-181~185-71kg~80kg-31-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-32-스키니핏", "청바지-181~185-71kg~80kg-32-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-33-스키니핏", "청바지-181~185-71kg~80kg-33-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-34-스키니핏", "청바지-181~185-71kg~80kg-34-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-35-스키니핏", "청바지-181~185-71kg~80kg-35-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-71kg~80kg-36이상-스키니핏", "청바지-181~185-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-181~185-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-181~185-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-28이하-스키니핏", "청바지-181~185-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-29-스키니핏", "청바지-181~185-81kg~90kg-29-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-30-스키니핏", "청바지-181~185-81kg~90kg-30-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-31-스키니핏", "청바지-181~185-81kg~90kg-31-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-32-스키니핏", "청바지-181~185-81kg~90kg-32-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-33-스키니핏", "청바지-181~185-81kg~90kg-33-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-34-스키니핏", "청바지-181~185-81kg~90kg-34-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-35-스키니핏", "청바지-181~185-81kg~90kg-35-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-81kg~90kg-36이상-스키니핏", "청바지-181~185-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-181~185-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-181~185-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-28이하-스키니핏", "청바지-181~185-91kg이상-28이하-슬림 스트레이트핏", "청바지-181~185-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-29-스키니핏", "청바지-181~185-91kg이상-29-슬림 스트레이트핏", "청바지-181~185-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-30-스키니핏", "청바지-181~185-91kg이상-30-슬림 스트레이트핏", "청바지-181~185-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-31-스키니핏", "청바지-181~185-91kg이상-31-슬림 스트레이트핏", "청바지-181~185-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-181~185-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-32-스키니핏", "청바지-181~185-91kg이상-32-슬림 스트레이트핏", "청바지-181~185-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-33-스키니핏", "청바지-181~185-91kg이상-33-슬림 스트레이트핏", "청바지-181~185-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-34-스키니핏", "청바지-181~185-91kg이상-34-슬림 스트레이트핏", "청바지-181~185-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-35-스키니핏", "청바지-181~185-91kg이상-35-슬림 스트레이트핏", "청바지-181~185-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-181~185-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-181~185-91kg이상-36이상-스키니핏", "청바지-181~185-91kg이상-36이상-슬림 스트레이트핏", "청바지-181~185-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          # 186이상

                                                          elsif @response == "청바지-186이상-50kg이하-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-28이하-스키니핏", "청바지-186이상-50kg이하-28이하-슬림 스트레이트핏", "청바지-186이상-50kg이하-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-50kg이하-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-29-스키니핏", "청바지-186이상-50kg이하-29-슬림 스트레이트핏", "청바지-186이상-50kg이하-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-50kg이하-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-30-스키니핏", "청바지-186이상-50kg이하-30-슬림 스트레이트핏", "청바지-186이상-50kg이하-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-50kg이하-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-31-스키니핏", "청바지-186이상-50kg이하-31-슬림 스트레이트핏", "청바지-186이상-50kg이하-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-50kg이하-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-32-스키니핏", "청바지-186이상-50kg이하-32-슬림 스트레이트핏", "청바지-186이상-50kg이하-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-50kg이하-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-33-스키니핏", "청바지-186이상-50kg이하-33-슬림 스트레이트핏", "청바지-186이상-50kg이하-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-50kg이하-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-34-스키니핏", "청바지-186이상-50kg이하-34-슬림 스트레이트핏", "청바지-186이상-50kg이하-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-50kg이하-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-35-스키니핏", "청바지-186이상-50kg이하-35-슬림 스트레이트핏", "청바지-186이상-50kg이하-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-50kg이하-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-50kg이하-36이상-스키니핏", "청바지-186이상-50kg이하-36이상-슬림 스트레이트핏", "청바지-186이상-50kg이하-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          
                                                          elsif @response == "청바지-186이상-51kg~60kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-28이하-스키니핏", "청바지-186이상-51kg~60kg-28이하-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-51kg~60kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-29-스키니핏", "청바지-186이상-51kg~60kg-29-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-51kg~60kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-30-스키니핏", "청바지-186이상-51kg~60kg-30-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-51kg~60kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-31-스키니핏", "청바지-186이상-51kg~60kg-31-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-51kg~60kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-32-스키니핏", "청바지-186이상-51kg~60kg-32-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-51kg~60kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-33-스키니핏", "청바지-186이상-51kg~60kg-33-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-51kg~60kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-34-스키니핏", "청바지-186이상-51kg~60kg-34-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-51kg~60kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-35-스키니핏", "청바지-186이상-51kg~60kg-35-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-51kg~60kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-51kg~60kg-36이상-스키니핏", "청바지-186이상-51kg~60kg-36이상-슬림 스트레이트핏", "청바지-186이상-51kg~60kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 

                                                          elsif @response == "청바지-186이상-61kg~70kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-28이하-스키니핏", "청바지-186이상-61kg~70kg-28이하-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-61kg~70kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-29-스키니핏", "청바지-186이상-61kg~70kg-29-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-61kg~70kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-30-스키니핏", "청바지-186이상-61kg~70kg-30-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-61kg~70kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-31-스키니핏", "청바지-186이상-61kg~70kg-31-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-61kg~70kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-32-스키니핏", "청바지-186이상-61kg~70kg-32-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-61kg~70kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-33-스키니핏", "청바지-186이상-61kg~70kg-33-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-61kg~70kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-34-스키니핏", "청바지-186이상-61kg~70kg-34-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-61kg~70kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-35-스키니핏", "청바지-186이상-61kg~70kg-35-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-61kg~70kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-61kg~70kg-36이상-스키니핏", "청바지-186이상-61kg~70kg-36이상-슬림 스트레이트핏", "청바지-186이상-61kg~70kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                            


                                                          elsif @response == "청바지-186이상-71kg~80kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-28이하-스키니핏", "청바지-186이상-71kg~80kg-28이하-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-71kg~80kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-29-스키니핏", "청바지-186이상-71kg~80kg-29-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-71kg~80kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-30-스키니핏", "청바지-186이상-71kg~80kg-30-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-71kg~80kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-31-스키니핏", "청바지-186이상-71kg~80kg-31-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-71kg~80kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-32-스키니핏", "청바지-186이상-71kg~80kg-32-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-71kg~80kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-33-스키니핏", "청바지-186이상-71kg~80kg-33-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-71kg~80kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-34-스키니핏", "청바지-186이상-71kg~80kg-34-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-71kg~80kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-35-스키니핏", "청바지-186이상-71kg~80kg-35-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-71kg~80kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-71kg~80kg-36이상-스키니핏", "청바지-186이상-71kg~80kg-36이상-슬림 스트레이트핏", "청바지-186이상-71kg~80kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok           




                                                          elsif @response == "청바지-186이상-81kg~90kg-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-28이하-스키니핏", "청바지-186이상-81kg~90kg-28이하-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-81kg~90kg-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-29-스키니핏", "청바지-186이상-81kg~90kg-29-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-81kg~90kg-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-30-스키니핏", "청바지-186이상-81kg~90kg-30-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-81kg~90kg-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-31-스키니핏", "청바지-186이상-81kg~90kg-31-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-81kg~90kg-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-32-스키니핏", "청바지-186이상-81kg~90kg-32-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-81kg~90kg-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-33-스키니핏", "청바지-186이상-81kg~90kg-33-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-81kg~90kg-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-34-스키니핏", "청바지-186이상-81kg~90kg-34-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-81kg~90kg-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-35-스키니핏", "청바지-186이상-81kg~90kg-35-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-81kg~90kg-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지핏을 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-81kg~90kg-36이상-스키니핏", "청바지-186이상-81kg~90kg-36이상-슬림 스트레이트핏", "청바지-186이상-81kg~90kg-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 


                                                          elsif @response == "청바지-186이상-91kg이상-28이하"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-28이하-스키니핏", "청바지-186이상-91kg이상-28이하-슬림 스트레이트핏", "청바지-186이상-91kg이상-28이하-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-91kg이상-29"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-29-스키니핏", "청바지-186이상-91kg이상-29-슬림 스트레이트핏", "청바지-186이상-91kg이상-29-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-91kg이상-30"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-30-스키니핏", "청바지-186이상-91kg이상-30-슬림 스트레이트핏", "청바지-186이상-91kg이상-30-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-91kg이상-31"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-31-스키니핏", "청바지-186이상-91kg이상-31-슬림 스트레이트핏", "청바지-186이상-91kg이상-31-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok
                                                          elsif @response == "청바지-186이상-91kg이상-32"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-32-스키니핏", "청바지-186이상-91kg이상-32-슬림 스트레이트핏", "청바지-186이상-91kg이상-32-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-91kg이상-33"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-33-스키니핏", "청바지-186이상-91kg이상-33-슬림 스트레이트핏", "청바지-186이상-91kg이상-33-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-91kg이상-34"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-34-스키니핏", "청바지-186이상-91kg이상-34-슬림 스트레이트핏", "청바지-186이상-91kg이상-34-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-91kg이상-35"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-35-스키니핏", "청바지-186이상-91kg이상-35-슬림 스트레이트핏", "청바지-186이상-91kg이상-35-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 
                                                          elsif @response == "청바지-186이상-91kg이상-36이상"
                                                                @response = {
                                                                  message: {
                                                                      text: "#{@user.name}님의 평소 선호하는 바지사이즈를 선택해주세요"
                                                                  },
                                                                  keyboard: {
                                                                    type: "buttons",
                                                                    buttons: ["청바지-186이상-91kg이상-36이상-스키니핏", "청바지-186이상-91kg이상-36이상-슬림 스트레이트핏", "청바지-186이상-91kg이상-36이상-레귤러핏"]
                                                                  }
                                                                }
                                                                    render json: @response, status: :ok 





                                                                                        #결과값
                                                                                        #part1



                                                                                        elsif @response == "청바지-165이하-50kg이하-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          elsif @response == "청바지-165이하-50kg이하-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          elsif @response == "청바지-165이하-50kg이하-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          elsif @response == "청바지-165이하-50kg이하-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          elsif @response == "청바지-165이하-50kg이하-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          elsif @response == "청바지-165이하-50kg이하-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          elsif @response == "청바지-165이하-50kg이하-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          elsif @response == "청바지-165이하-50kg이하-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          elsif @response == "청바지-165이하-50kg이하-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          elsif @response == "청바지-165이하-50kg이하-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-165이하-50kg이하-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-51kg~60kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키165 몸무게56kg의 다른 회원은 허리 28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-51kg~60kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키165 몸무게56kg의 다른 회원은 허리28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-51kg~60kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키165 몸무게56kg의 다른 회원은 허리 기장30 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-51kg~60kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키165 몸무게56kg의 다른 회원은 허리 31 기장31 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-51kg~60kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키165 몸무게56kg의 다른 회원은 허리 32 기장32 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-51kg~60kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키165 몸무게56kg의 다른 회원은 허리 33 기장33 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-51kg~60kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키165 몸무게56kg의 다른 회원은 허리 34 기장34 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-51kg~60kg-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키165 몸무게56kg의 다른 회원은 허리 35 기장35 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-51kg~60kg-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키165 몸무게56kg의 다른 회원은 허리 36 기장36 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-51kg~60kg-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게64kg의 다른 회원은 허리 28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게64kg의 다른 회원은 허리28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게64kg의 다른 회원은 허리 기장30 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게64kg의 다른 회원은 허리 31 기장31 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게64kg의 다른 회원은 허리 32 기장32 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게64kg의 다른 회원은 허리 33 기장33 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게64kg의 다른 회원은 허리 34 기장34 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게64kg의 다른 회원은 허리 35 기장35 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게64kg의 다른 회원은 허리 36 기장36 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-61kg~70kg-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok

                                                                                      # 165-71~80

                                                                                      elsif @response == "청바지-165이하-71kg~80kg-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-71kg~80kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게74kg의 다른 회원은 허리 28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-71kg~80kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게74kg의 다른 회원은 허리28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-71kg~80kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게74kg의 다른 회원은 허리 기장30 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-71kg~80kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게74kg의 다른 회원은 허리 31 기장31 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-71kg~80kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게74kg의 다른 회원은 허리 32 기장32 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-71kg~80kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게74kg의 다른 회원은 허리 33 기장33 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-71kg~80kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게74kg의 다른 회원은 허리 34 기장34 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-71kg~80kg-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게74kg의 다른 회원은 허리 35 기장35 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-71kg~80kg-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게74kg의 다른 회원은 허리 36 기장36 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-71kg~80kg-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      
                                                                                      # 165-81~90
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-81kg~90kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게84kg의 다른 회원은 허리 28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-81kg~90kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게84kg의 다른 회원은 허리28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-81kg~90kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게84kg의 다른 회원은 허리 기장30 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-81kg~90kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게84kg의 다른 회원은 허리 31 기장31 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-81kg~90kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게84kg의 다른 회원은 허리 32 기장32 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-81kg~90kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게84kg의 다른 회원은 허리 33 기장33 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-81kg~90kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게84kg의 다른 회원은 허리 34 기장34 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-81kg~90kg-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게84kg의 다른 회원은 허리 35 기장35 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-81kg~90kg-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게84kg의 다른 회원은 허리 36 기장36 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-81kg~90kg-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok


                                                                                      # 165-91

                                                                                      elsif @response == "청바지-165이하-91kg이상-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-91kg이상-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게91kg의 다른 회원은 허리 28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-91kg이상-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게91kg의 다른 회원은 허리28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-91kg이상-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게91kg의 다른 회원은 허리 기장30 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-91kg이상-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게91kg의 다른 회원은 허리 31 기장31 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-91kg이상-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게91kg의 다른 회원은 허리 32 기장32 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-91kg이상-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게91kg의 다른 회원은 허리 33 기장33 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-91kg이상-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게91kg의 다른 회원은 허리 34 기장34 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-91kg이상-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게91kg의 다른 회원은 허리 35 기장35 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-91kg이상-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게91kg의 다른 회원은 허리 36 기장36 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-165이하-91kg이상-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 74.32cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          
                                                                                          
                                                                                      elsif @response == "청바지-166~170-50kg이하-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-50kg이하-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-50kg이하-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-50kg이하-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-50kg이하-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-50kg이하-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-50kg이하-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-50kg이하-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-50kg이하-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-50kg이하-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-50kg이하-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-50kg이하-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-166~170-50kg이하-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-50kg이하-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리32사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-50kg이하-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-50kg이하-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-50kg이하-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리33사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-50kg이하-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-166~170-50kg이하-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-50kg이하-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리34사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-50kg이하-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok  
                                                                                      elsif @response == "청바지-166~170-50kg이하-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-50kg이하-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리35사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-50kg이하-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-50kg이하-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-50kg이하-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리36사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-50kg이하-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                      elsif @response == "청바지-166~170-51kg~60kg-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-51kg~60kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 3명의 비슷한 회원들이 허리 28 기장 29을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 30을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-51kg~60kg-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키170 몸무게56kg의 다른 회원은 허리 29 기장30의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-51kg~60kg-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키166 몸무게59kg의 다른 회원은 허리 30 기장29의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-51kg~60kg-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-166~170-51kg~60kg-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리32사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-51kg~60kg-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리33사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-166~170-51kg~60kg-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리34사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok  
                                                                                      elsif @response == "청바지-166~170-51kg~60kg-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리35사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-51kg~60kg-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리36사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-166~170-61kg~70kg-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-61kg~70kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 3명의 비슷한 회원들이 허리 28 기장 29을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 30을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-61kg~70kg-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 3명의 비슷한 회원들이 허리 29 기장 29을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 30을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-61kg~70kg-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키168 몸무게64kg의 다른 회원은 허리 30 기장28의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-61kg~70kg-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-166~170-61kg~70kg-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키168~170 몸무게68kg의 다른 회원은 허리 32 기장30의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-61kg~70kg-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리33사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-166~170-61kg~70kg-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리34사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok  
                                                                                      elsif @response == "청바지-166~170-61kg~70kg-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리35사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-61kg~70kg-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리36사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-71kg~80kg-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-71kg~80kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 3명의 비슷한 회원들이 허리 28 기장 29을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 30을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-71kg~80kg-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키170 몸무게56kg의 다른 회원은 허리 29 기장30의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-71kg~80kg-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키166 몸무게59kg의 다른 회원은 허리 30 기장29의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-71kg~80kg-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-166~170-71kg~80kg-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리32사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-71kg~80kg-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리33사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-166~170-71kg~80kg-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리34사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok  
                                                                                      elsif @response == "청바지-166~170-71kg~80kg-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리35사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-71kg~80kg-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리36사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-71kg~80kg-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-166~170-81kg~90kg-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-81kg~90kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 3명의 비슷한 회원들이 허리 28 기장 29을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 30을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-81kg~90kg-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키170 몸무게56kg의 다른 회원은 허리 29 기장30의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-81kg~90kg-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키166 몸무게59kg의 다른 회원은 허리 30 기장29의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-81kg~90kg-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-166~170-81kg~90kg-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리32사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-81kg~90kg-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리33사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-166~170-81kg~90kg-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리34사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok  
                                                                                      elsif @response == "청바지-166~170-81kg~90kg-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리35사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-81kg~90kg-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리36사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-81kg~90kg-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                      elsif @response == "청바지-166~170-91kg이상-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-91kg이상-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 3명의 비슷한 회원들이 허리 28 기장 29을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 30을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-166~170-91kg이상-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-91kg이상-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-91kg이상-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키170 몸무게56kg의 다른 회원은 허리 29 기장30의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-91kg이상-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-91kg이상-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-91kg이상-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키166 몸무게59kg의 다른 회원은 허리 30 기장29의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-91kg이상-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-91kg이상-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-91kg이상-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-91kg이상-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-166~170-91kg이상-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-91kg이상-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리32사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-91kg이상-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-91kg이상-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-91kg이상-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리33사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-91kg이상-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-166~170-91kg이상-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-91kg이상-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리34사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-91kg이상-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok  
                                                                                      elsif @response == "청바지-166~170-91kg이상-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-91kg이상-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리35사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-91kg이상-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-166~170-91kg이상-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-166~170-91kg이상-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리36사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-166~170-91kg이상-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 76.94cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          
                                                                                      elsif @response == "청바지-171~175-50kg이하-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-171~175-50kg이하-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리28사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-171~175-50kg이하-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                      elsif @response == "청바지-171~175-50kg이하-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-50kg이하-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리29사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-50kg이하-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-50kg이하-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-50kg이하-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리30사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-50kg이하-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-50kg이하-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-50kg이하-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리31사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-50kg이하-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-171~175-50kg이하-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-50kg이하-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리32사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-50kg이하-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-50kg이하-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-50kg이하-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리33사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-50kg이하-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-171~175-50kg이하-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-50kg이하-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리34사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-50kg이하-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok  
                                                                                      elsif @response == "청바지-171~175-50kg이하-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-50kg이하-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리35사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-50kg이하-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-50kg이하-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-50kg이하-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리36사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-50kg이하-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                          
                                                                                      elsif @response == "청바지-171~175-51kg~60kg-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-171~175-51kg~60kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 3명의 비슷한 회원들이 허리 28 기장 29을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 30을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-171~175-51kg~60kg-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키172 몸무게60kg의 다른 회원은 허리 29 기장29의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-51kg~60kg-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키171 몸무게60kg의 다른 회원은 허리 30 기장30의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-51kg~60kg-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 전통 셀비지 데님에 신축성을 더해 편안함을 자랑하는 스트레치 셀비지 슬림피트 진. 허리31사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/3"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-171~175-51kg~60kg-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리32사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-51kg~60kg-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리33사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-171~175-51kg~60kg-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리34사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok  
                                                                                      elsif @response == "청바지-171~175-51kg~60kg-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리35사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-51kg~60kg-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리36사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-171~175-61kg~70kg-28이하-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리28사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-171~175-61kg~70kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키171 몸무게68kg의 다른 회원은 허리 28 기장28의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                          elsif @response == "청바지-171~175-61kg~70kg-28이하-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리28사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-29-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리29사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 2명의 비슷한 회원들이 허리 29 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-29-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리29사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-61kg~70kg-30-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리30사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 7명의 비슷한 회원들이 허리 30 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-30-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리30사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-61kg~70kg-31-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 슬림하고 샤프한 실루엣의 계절감을 더한 컬러 타입의 스키니 피트 진입니다. 허리31사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/6"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 9명의 비슷한 회원들이 허리 31 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-31-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리31사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-171~175-61kg~70kg-32-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리32사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키175 몸무게68kg의 다른 회원은 허리 32 기장30의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-32-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리32사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-61kg~70kg-33-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리33사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리33사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-33-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리33사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-171~175-61kg~70kg-34-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리34사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리34사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-34-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리34사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok  
                                                                                      elsif @response == "청바지-171~175-61kg~70kg-35-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리35사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-35-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리35사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-35-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리35사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok 
                                                                                      elsif @response == "청바지-171~175-61kg~70kg-36이상-스키니핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 가장 슬림한 실루엣! 놀라운 스트레치성을 지닌 울트라 스트레치 스키니피트진 허리36사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/5"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                      
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-36이상-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 웨이스트는 립 사양으로 절묘한 피트감과 스타일리시함으로 업데이트된 EZY진. 허리36사이즈 다리길이 76cm에 맞춰서 보내드립니다. 관련상품 구매하러가기-> https://more-fit-jeongjeahyoun.c9users.io/detail/7"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 
                                                                                          
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-36이상-레귤러핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 레귤러 스트레이트 실루엣으로 누구에게나 추천하는 아이템! 허리36사이즈 다리길이 79.24cm에 맞춰서 보내드립니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/4"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      } 
                                                                                          render json: @response, status: :ok
                                                                                      










                                                                                      # 이전

                                                                                      elsif @response == "청바지-165이하-51kg~60kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키165 몸무게56kg의 다른 회원은 허리 28 기장29 사이즈의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok 

                                                                                      elsif @response == "청바지-165이하-61kg~70kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키162 몸무게64kg의 다른 회원은 허리 30 기장28의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                      elsif @response == "청바지-166~170-51kg~60kg-28-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 3명의 비슷한 회원들이 허리 28 기장 29을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 30을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-166~170-51kg~60kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키166 몸무게59kg의 다른 회원은 허리 30 기장29의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 3명의 비슷한 회원들이 허리 29 기장 29을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 30을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키168 몸무게64kg의 다른 회원은 허리 30 기장28의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-166~170-61kg~70kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키168~170 몸무게68kg의 다른 회원은 허리 32 기장30의 레졸루트 710모델을 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키172 몸무게60kg의 다른 회원은 허리 29 기장29의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-51kg~60kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키171 몸무게60kg의 다른 회원은 허리 30 기장30의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-28이하-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키171 몸무게68kg의 다른 회원은 허리 28 기장28의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 2명의 비슷한 회원들이 허리 29 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 7명의 비슷한 회원들이 허리 30 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 9명의 비슷한 회원들이 허리 31 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-61kg~70kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키175 몸무게68kg의 다른 회원은 허리 32 기장30의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-71kg~80kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키172 몸무게72kg의 다른 회원은 허리31  기장29의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-71kg~80kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키172 몸무게72kg의 다른 회원은 허리32  기장29의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-71kg~80kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키175 몸무게74kg의 다른 회원은 허리33  기장30의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-71kg~80kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키175 몸무게80kg의 다른 회원은 허리34  기장32의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-171~175-81kg~90kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키174 몸무게82kg의 다른 회원은 허리32  기장29의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-176~180-51kg~60kg-28-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키176 몸무게51kg의 다른 회원은 허리27  기장31의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-176~180-61kg~70kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 5명의 비슷한 회원들이 허리 30 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-176~180-61kg~70kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 4명의 비슷한 회원들이 허리 31 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-176~180-61kg~70kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 4명의 비슷한 회원들이 허리 32 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-176~180-71kg~80kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 2명의 비슷한 회원들이 허리 31 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-176~180-71kg~80kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 2명의 비슷한 회원들이 허리 32 기장 30을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-176~180-71kg~80kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 2명의 비슷한 회원들이 허리 33 기장 32을 가장 많이 추천했습니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-181~185-61kg~70kg-29-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키182 몸무게64kg의 다른 회원은 허리29  기장31의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-181~185-61kg~70kg-30-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키184 몸무게69kg의 다른 회원은 허리30  기장31의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-181~185-61kg~70kg-31-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키181 몸무게68kg의 다른 회원은 허리31  기장32의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-181~185-61kg~70kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키182 몸무게70kg의 다른 회원은 허리32  기장31의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-181~185-71kg~80kg-32-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 5명의 비슷한 회원들이 허리 32 기장 32을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-181~185-71kg~80kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 2명의 비슷한 회원들이 허리 33 기장 32을 가장 많이 추천했습니다. 기장을 조금 접어 롤업해서 입으시려면 기장 31을 선택해주세요. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-181~185-71kg~80kg-34-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키183 몸무게80kg의 다른 회원은 허리34  기장30의 레졸루트 710모델을 구매했다가 33/31로 재구매하였습니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
                                                                                        },
                                                                                        keyboard: {
                                                                                          type: "buttons",
                                                                                          buttons: ["나에게 가장 잘맞는 청바지추천", "나에게 가장 잘맞는 정장바지추천", "나에게 가장 잘맞는 반바지추천"]
                                                                                        }
                                                                                      }
                                                                                          render json: @response, status: :ok
                                                                                          elsif @response == "청바지-181~185-81kg~90kg-33-슬림 스트레이트핏"
                                                                                      @response = {
                                                                                        message: {
                                                                                            text: "#{@user.name}님추천 : 키181 몸무게84kg의 다른 회원은 허리33  기장31의 레졸루트 710모델이 잘맞는다고 생각합니다. 관련 상품 구매하러가기->https://more-fit-jeongjeahyoun.c9users.io/detail/1"
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