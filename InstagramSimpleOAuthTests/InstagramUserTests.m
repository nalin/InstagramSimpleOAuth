#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "FakeInstagramOAuthResponse.h"
#import "InstagramSimpleOAuth.h"


SpecBegin(IGUserTests)

describe(@"IGUser", ^{
    __block IGUser *user;
    
    beforeEach(^{
        user = [[IGUser alloc] initWithDictionary:[FakeInstagramOAuthResponse userResponse]];
    });
    
    describe(@"init", ^{
        it(@"calls -initWithInstagramAuthResponse: with nil parameters", ^{
            user = [[IGUser alloc] init];
            expect(user.userID).to.beNil();
            expect(user.username).to.beNil();
            expect(user.fullName).to.beNil();
            expect(user.profilePictureURL).to.beNil();
        });
    });
    
    it(@"has an userID", ^{
        expect(user.userID).to.equal(@"yepyepyep");
    });
    
    it(@"has a username", ^{
        expect(user.username).to.equal(@"og-gsta");
    });
    
    it(@"has a fullName", ^{
        expect(user.fullName).to.equal(@"Ice Cube");
    });
    
    it(@"has a profile picture URL", ^{
        expect(user.profilePictureURL).to.equal([NSURL URLWithString:@"http://uh.yeah.yuuueaaah.com/og-gsta"]);
    });
});

SpecEnd