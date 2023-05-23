Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC5B70E245
	for <lists+linux-tegra@lfdr.de>; Tue, 23 May 2023 18:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237676AbjEWQeL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 May 2023 12:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236334AbjEWQeK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 May 2023 12:34:10 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 23 May 2023 09:33:53 PDT
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6101BE72
        for <linux-tegra@vger.kernel.org>; Tue, 23 May 2023 09:33:53 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 747c35c3-f987-11ed-abf4-005056bdd08f;
        Tue, 23 May 2023 19:32:49 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Tue, 23 May 2023 19:32:48 +0300
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Prathamesh Shete <pshete@nvidia.com>, thierry.reding@gmail.com,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com, kyarlagadda@nvidia.com,
        Manish Bhardwaj <mbhardwaj@nvidia.com>
Subject: Re: [PATCH v3] gpio: tegra186: Check GPIO pin permission before
 access.
Message-ID: <ZGzqsGG7uTYkO7Uf@surfacebook>
References: <Yz62XmiH8YG3Dtsf@orome>
 <20221007055936.5446-1-pshete@nvidia.com>
 <CACRpkdYkJdZ67kyTnDg3xFzO8MJhC0nHK98O+KJwCLBqV_5f-Q@mail.gmail.com>
 <1de5b7fb-a39e-183a-1407-7d6489f706b4@nvidia.com>
 <CAMRc=MdCiieaYR3BeATm+2o8UDz+9D5vs=dTNDAavi19BmKZ8w@mail.gmail.com>
 <a3d7c16f-fe87-9c04-5f92-42f10597df6d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3d7c16f-fe87-9c04-5f92-42f10597df6d@nvidia.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tue, May 23, 2023 at 02:42:52PM +0100, Jon Hunter kirjoitti:
> On 23/05/2023 10:17, Bartosz Golaszewski wrote:
> > On Tue, May 23, 2023 at 8:22 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> > > On 17/10/2022 10:31, Linus Walleij wrote:

...

> > > I did not see this anywhere in the mainline/next. However, I also
> > > noticed that we don't have the correct email address for Bartosz (again).
> > 
> > I have only ever changed my address in MAINTAINERS once, so "again" is
> > not really the right term. And scripts/get_maintainer.pl should be
> > used anyway every time when submitting patches.
> 
> Sorry I meant that WE did not send to the correct email AGAIN and not that
> you updated your email address :-)

FWIW, you may look into my "smart" script [1] which automatically fills the Cc
and To WRT MAINTAINERS records.

[1]: https://lore.kernel.org/linux-gpio/Yz62XmiH8YG3Dtsf@orome/T/#t

-- 
With Best Regards,
Andy Shevchenko


