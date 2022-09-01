Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514A65A942A
	for <lists+linux-tegra@lfdr.de>; Thu,  1 Sep 2022 12:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233923AbiIAKSO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 1 Sep 2022 06:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbiIAKSC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Sep 2022 06:18:02 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC6F134D62
        for <linux-tegra@vger.kernel.org>; Thu,  1 Sep 2022 03:18:00 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 21so7925794ybl.6
        for <linux-tegra@vger.kernel.org>; Thu, 01 Sep 2022 03:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=YcwEmk+jhglXU/PDEd+S64IKTAaaRxXgfNIAlVa0HIbH/TOXTbZZQLtpokZkXdzz5z
         0rmzJvz4Bk+0NfVhxc+ew1RCdsAJj54Njv3FHYH6MQ+DCKdqrBl5YjkoBrrPnEkeDsra
         T41huZkcrN1D5QDXWIZOXL9Yux786VPVpg7OZejVuLRyK6+5Bb1Nph3RAHhtitktmnJq
         ReIZfbG3iRQ4CRCiqigliMBX+HApDaU7JmW53sso5Mj2ylbbCVPwpf413lQ2oazKK+Hs
         OftOjKDN4xsTa6J5+cbET8ltg9RPU9tMzcpA0vkM3zRCFxpA4sQfJ9HQ54lZu7KnNGQj
         AH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=MfwpM0z7r8atcdVx7qaN2pnD2XioB8S6aZyFoRfgM5md8u3yj84IFOPg4MBdhjYRMa
         CVXh2xvIC7UJDhI/EtZEwPjle4uDsu6j8eiil0hVHVl54V2K17OSUwldoQu25aq4xf64
         nBZ5zUxaZwqRUYH5KuGbU2vLqOeZKSMKJga4m+n3lXnZPBvD8Zbh+vXRnZ16zzlIVurZ
         eYWnZL33yDpuGJcMdk3comHSwkK4ppf+tsjVwUEOC5Ikznl4AgOeI8BzJDRYiXay+Uau
         5zzxwmYZosGbIRTg/VYiXBBJTlTSjnjB0Q7lliiPXlrxOAv0GW+A2MI0EBSURcqkus5v
         YsJA==
X-Gm-Message-State: ACgBeo2jWtURBl6UXC8iDVd9gGm1P60DHKuOQP2gryuAJQIRUiSy56jn
        jwrSVgsuEycs/o50jUG11MX5Hgpnq3qNN5ghCLU=
X-Google-Smtp-Source: AA6agR6iO8WH7n39+E8ZfNJmgNhhKePceDUbvhsbdXAZcyAFpAA32vBiamCWgzz9dppFlTLV0M7a57qdSLHXzr9JziA=
X-Received: by 2002:a25:40c5:0:b0:694:e710:a26 with SMTP id
 n188-20020a2540c5000000b00694e7100a26mr17812885yba.509.1662027478663; Thu, 01
 Sep 2022 03:17:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6902:1007:0:0:0:0 with HTTP; Thu, 1 Sep 2022 03:17:58
 -0700 (PDT)
Reply-To: maryalbert00045@gmail.com
From:   Mary Albert <marywilliams02577@gmail.com>
Date:   Thu, 1 Sep 2022 11:17:58 +0100
Message-ID: <CAMiZWCLFU8d7REYs0O7oqhEMeAzSJDKyBb6GaShea-Oq4qPSRg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4990]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [marywilliams02577[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [marywilliams02577[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [maryalbert00045[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

-- 
Hello,
how are you?
