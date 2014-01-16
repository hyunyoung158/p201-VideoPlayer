//
//  ViewController.m
//  VideoPlayer
//
//  Created by SDT-1 on 2014. 1. 16..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

#define MOVIE_URL @"http://movies.apple.com/media/kr/iphone/2011/tours/apple-iphone4s-feature_keynote-kr-20111110_r848-9cie.mov"

@interface ViewController ()

@end

@implementation ViewController {
    MPMoviePlayerController *player;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //재생 상태 변경 알림 감시자 등록
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleStateChanged:) name:@"MPMoviePlayerPlaybackStateDidChangeNotification" object:nil];
    //미디어 소스 타입(파일, 스트리밍) 알림 감시자 등록

//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"movie" withExtension:@"mp4"];
    //스트리밍 영상 재생용
    NSURL *url = [NSURL URLWithString:MOVIE_URL];
    player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [player prepareToPlay];
    
    //부모 뷰의 크기
    [player.view setFrame:self.view.bounds];
    
    [self.view addSubview:player.view];
    [player play];
}

- (void)handleMediaTypeNoti:(NSNotification *)noti {
    MPMoviePlayerController *p = noti.object;
    NSLog(@"Media source type : %d", (int)p.movieSourceType);
}

- (void)handleStateChanged:(NSNotification *)noti {
    MPMoviePlayerController *p = noti.object;
    NSLog(@"playback state : %d", p.playbackState);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
