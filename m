Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7F74C79F7
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Feb 2022 21:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiB1ULg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Feb 2022 15:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbiB1ULe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Feb 2022 15:11:34 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37F58AE4D
        for <linux-tegra@vger.kernel.org>; Mon, 28 Feb 2022 12:10:53 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 29so18956979ljv.10
        for <linux-tegra@vger.kernel.org>; Mon, 28 Feb 2022 12:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LeZ8UzRXrDw4d1M4BG6ctt9COK0EF5j9qtOsLWtMfJg=;
        b=Jhdls+DdmLi+4DWS7o2GehQ/Yg8vWPth9HxY0ymuDsFhiEF5hlRLzgd1PV4wJ4dLVJ
         JdRWd6PhVxu3cPtesSY0XREEgjw/sVhI1zgx2ECNJUHRlykk7MmbqhfMtkifVM/LmgYS
         6chNfwYqW0eu75y5MSRY9nnHOEZnFkvhMXNYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LeZ8UzRXrDw4d1M4BG6ctt9COK0EF5j9qtOsLWtMfJg=;
        b=Qx68d3uLzr3M13TcWlPca2fkSYgyC3iBCSk5UQOdsX2VyjRSIiKhLVLT33XO1kgCV+
         OaXA/E/GZxytp19Dy01M5MxKWE3hc5FrWIG7U1GjmhMmT1CbW/cFjzBaBxwCoA61mIVY
         9SjcvlaXrahzBl+rVm4q6s326dynYkmWyM//6tohM97pwJiOrBBTxFKQ63diAS9awlDT
         S5wcTBlQc5zz02BLI1xtOFDwtKym+Fzu3HAEVCbjuXIqC8jge1ZFtLott/l1K/Cbob3U
         LUw5akUsoAR5IuoyM8kVzqDuMclpFuUFOe4C+0TJQoz+Zs9PwSiL2BVeIuoHfzgRz6Nt
         Q2uw==
X-Gm-Message-State: AOAM533yUXMRKhoyIizLKYiHBD2jB3sFxPoQRsN/fxnV7EK4o6Nfl30G
        WtcL5aQkt91RawVoZ01Zf1YI66CI9Lw2zeBXmE4=
X-Google-Smtp-Source: ABdhPJzh7wKFzfyecoAKjwq8VVZqkWZ9enfpZ8cTeHjgR8ymsqiVzHJymCcbh67F49EzF/YBaJmtkA==
X-Received: by 2002:a2e:bc1e:0:b0:247:f0a:84ee with SMTP id b30-20020a2ebc1e000000b002470f0a84eemr1217034ljf.444.1646079052084;
        Mon, 28 Feb 2022 12:10:52 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id j9-20020a2ea909000000b0023742cb505dsm1502519ljq.82.2022.02.28.12.10.51
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 12:10:52 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id y24so23334347lfg.1
        for <linux-tegra@vger.kernel.org>; Mon, 28 Feb 2022 12:10:51 -0800 (PST)
X-Received: by 2002:ac2:4d91:0:b0:443:127b:558a with SMTP id
 g17-20020ac24d91000000b00443127b558amr14027806lfe.542.1646079041191; Mon, 28
 Feb 2022 12:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com> <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
In-Reply-To: <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 28 Feb 2022 12:10:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
Message-ID: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Jakob Koschel <jakobkoschel@gmail.com>,
        alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        samba-technical@lists.samba.org,
        linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
        linux-arch <linux-arch@vger.kernel.org>,
        CIFS <linux-cifs@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        intel-wired-lan@lists.osuosl.org,
        kgdb-bugreport@lists.sourceforge.net,
        bcm-kernel-feedback-list@broadcom.com,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergman <arnd@arndb.de>,
        Linux PM <linux-pm@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        v9fs-developer@lists.sourceforge.net,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sgx@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux F2FS Dev Mailing List 
        <linux-f2fs-devel@lists.sourceforge.net>,
        tipc-discussion@lists.sourceforge.net,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        dma <dmaengine@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="0000000000008601b205d919a4ad"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

--0000000000008601b205d919a4ad
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 12:03 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Side note: we do need *some* way to do it.

Ooh.

This patch is a work of art.

And I mean that in the worst possible way.

We can do

        typeof(pos) pos

in the 'for ()' loop, and never use __iter at all.

That means that inside the for-loop, we use a _different_ 'pos' than outside.

And then the compiler will not see some "might be uninitialized", but
the outer 'pos' *will* be uninitialized.

Unless, of course, the outer 'pos' had that pointless explicit initializer.

Here - can somebody poke holes in this "work of art" patch?

                     Linus

--0000000000008601b205d919a4ad
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_l074y7ca0>
X-Attachment-Id: f_l074y7ca0

IE1ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGFyY2gveDg2L2tlcm5lbC9j
cHUvc2d4L2VuY2wuYyB8IDIgKy0KIGluY2x1ZGUvbGludXgvbGlzdC5oICAgICAgICAgICB8IDYg
KysrLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IGRhZWI1Yzg4YjUwYi4uY2M0
YjBhMjY2YWYwIDEwMDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtlZmlsZQpAQCAtNTE1LDcg
KzUxNSw3IEBAIEtCVUlMRF9DRkxBR1MgICA6PSAtV2FsbCAtV3VuZGVmIC1XZXJyb3I9c3RyaWN0
LXByb3RvdHlwZXMgLVduby10cmlncmFwaHMgXAogCQkgICAtZm5vLXN0cmljdC1hbGlhc2luZyAt
Zm5vLWNvbW1vbiAtZnNob3J0LXdjaGFyIC1mbm8tUElFIFwKIAkJICAgLVdlcnJvcj1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbiAtV2Vycm9yPWltcGxpY2l0LWludCBcCiAJCSAgIC1XZXJy
b3I9cmV0dXJuLXR5cGUgLVduby1mb3JtYXQtc2VjdXJpdHkgXAotCQkgICAtc3RkPWdudTg5CisJ
CSAgIC1zdGQ9Z251MTEKIEtCVUlMRF9DUFBGTEFHUyA6PSAtRF9fS0VSTkVMX18KIEtCVUlMRF9B
RkxBR1NfS0VSTkVMIDo9CiBLQlVJTERfQ0ZMQUdTX0tFUk5FTCA6PQpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva2VybmVsL2NwdS9zZ3gvZW5jbC5jIGIvYXJjaC94ODYva2VybmVsL2NwdS9zZ3gvZW5j
bC5jCmluZGV4IDQ4YWZlOTZhZTBmMC4uODdkYjJmMzkzNmIwIDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9rZXJuZWwvY3B1L3NneC9lbmNsLmMKKysrIGIvYXJjaC94ODYva2VybmVsL2NwdS9zZ3gvZW5j
bC5jCkBAIC00NTAsNyArNDUwLDcgQEAgc3RhdGljIHZvaWQgc2d4X21tdV9ub3RpZmllcl9yZWxl
YXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAogCQkJCSAgICAgc3RydWN0IG1tX3N0cnVjdCAq
bW0pCiB7CiAJc3RydWN0IHNneF9lbmNsX21tICplbmNsX21tID0gY29udGFpbmVyX29mKG1uLCBz
dHJ1Y3Qgc2d4X2VuY2xfbW0sIG1tdV9ub3RpZmllcik7Ci0Jc3RydWN0IHNneF9lbmNsX21tICp0
bXAgPSBOVUxMOworCXN0cnVjdCBzZ3hfZW5jbF9tbSAqdG1wOwogCiAJLyoKIAkgKiBUaGUgZW5j
bGF2ZSBpdHNlbGYgY2FuIHJlbW92ZSBlbmNsX21tLiAgTm90ZSwgb2JqZWN0cyBjYW4ndCBiZSBt
b3ZlZApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9saXN0LmggYi9pbmNsdWRlL2xpbnV4L2xp
c3QuaAppbmRleCBkZDZjMjA0MWQwOWMuLjcwODA3OGIyZjI0ZCAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9saXN0LmgKKysrIGIvaW5jbHVkZS9saW51eC9saXN0LmgKQEAgLTYzNCw5ICs2MzQs
OSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbGlzdF9zcGxpY2VfdGFpbF9pbml0KHN0cnVjdCBsaXN0
X2hlYWQgKmxpc3QsCiAgKiBAaGVhZDoJdGhlIGhlYWQgZm9yIHlvdXIgbGlzdC4KICAqIEBtZW1i
ZXI6CXRoZSBuYW1lIG9mIHRoZSBsaXN0X2hlYWQgd2l0aGluIHRoZSBzdHJ1Y3QuCiAgKi8KLSNk
ZWZpbmUgbGlzdF9mb3JfZWFjaF9lbnRyeShwb3MsIGhlYWQsIG1lbWJlcikJCQkJXAotCWZvciAo
cG9zID0gbGlzdF9maXJzdF9lbnRyeShoZWFkLCB0eXBlb2YoKnBvcyksIG1lbWJlcik7CVwKLQkg
ICAgICFsaXN0X2VudHJ5X2lzX2hlYWQocG9zLCBoZWFkLCBtZW1iZXIpOwkJCVwKKyNkZWZpbmUg
bGlzdF9mb3JfZWFjaF9lbnRyeShwb3MsIGhlYWQsIG1lbWJlcikJCQkJCVwKKwlmb3IgKHR5cGVv
Zihwb3MpIHBvcyA9IGxpc3RfZmlyc3RfZW50cnkoaGVhZCwgdHlwZW9mKCpwb3MpLCBtZW1iZXIp
OwlcCisJICAgICAhbGlzdF9lbnRyeV9pc19oZWFkKHBvcywgaGVhZCwgbWVtYmVyKTsJXAogCSAg
ICAgcG9zID0gbGlzdF9uZXh0X2VudHJ5KHBvcywgbWVtYmVyKSkKIAogLyoqCg==
--0000000000008601b205d919a4ad--
