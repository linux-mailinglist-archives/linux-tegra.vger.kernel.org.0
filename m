Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 664874E614B
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Mar 2022 10:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349306AbiCXJwX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Mar 2022 05:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239549AbiCXJwX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Mar 2022 05:52:23 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD175549E
        for <linux-tegra@vger.kernel.org>; Thu, 24 Mar 2022 02:50:51 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id i63so4291857vsi.5
        for <linux-tegra@vger.kernel.org>; Thu, 24 Mar 2022 02:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=13+rXwGRPr4a9k2vxA2bU+fJEZZ58Un4R7s1pCG1lS8=;
        b=OIal0zhKtYLNOi5tWoB6+OLkKwTrN1x6/baG3wbC5VXjYHMLxN6cDVHhtcTv63ZJxJ
         t3OHWuSc7Y9WYZRWMtaf7rDG838S7zFotcEfsW15YE+5EwUUkT45DamaeL26gf8SZX+L
         R1xyKt5WejbRJtRDixuyDZ5BF62BVu3FKcVMbKRfX2ReHjD+TVSQ863IxNlmficiyrQB
         QF+GPkVZmRFC4vkCmOHblG/lZDKOFzAdWJmx5sgXZheFfgf34vfElKFgnK5dw9yLaLza
         phJJEsV6uWnpykt1vAaQ94s+3dkFHbOJ3B0nvnug3362QN96VZmaU2MOWXEhglORksyk
         VIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=13+rXwGRPr4a9k2vxA2bU+fJEZZ58Un4R7s1pCG1lS8=;
        b=Lks+Ts0auT8+l4K81RnkAmtRooE0QfrMM8ihJr2aWEsYJqLO5oPOKUS1PJqyLQoenG
         HOAieBcWYSr8hCggeJs3NId7o+EFs+XatUhflmRAyXxylRRWBXUPzS3i3O7AYRmldYbW
         5UAzTHnFMQWwZZxW+E91/1yuBbY6IVB62Wj2pnoXzskqpWcPJopTwi/FsbB+7RBmwv5T
         /YDjdoxdyfgB8siePSG7qamS/MV/DnX0FsZ9mF1mGqhOXAKKVCM5qY/Ex7kB1u4z/r6J
         G4RzIqS4zlFynX3PZtGtJki2j90MzG3JszzaVLbJrs6P4Ew0IgbmH9qx+oT3Yq3Ekm9s
         yhwQ==
X-Gm-Message-State: AOAM533jb8u8B4A+u+19/zg+ar9Efb+UUdJBXzGfXrtboGe9PndPWFOm
        4/LTr97WIuhMYcMyAiAgOUiTYJaubudmW4oXt68=
X-Google-Smtp-Source: ABdhPJxMtOFNNdgUkjeMOgLnLy6ssTAgWzcpMBGAtm05y7cuV8Gm03UxS4wUDTlgsF+ZCWaSpm3t5vH5HFiqwjiGjfA=
X-Received: by 2002:a05:6102:5094:b0:325:5ffb:fb0e with SMTP id
 bl20-20020a056102509400b003255ffbfb0emr688844vsb.68.1648115450544; Thu, 24
 Mar 2022 02:50:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:5c12:0:b0:2a3:1110:6996 with HTTP; Thu, 24 Mar 2022
 02:50:50 -0700 (PDT)
Reply-To: ozkansahin.gbbva@gmail.com
From:   OZKAN SAHIN <ahmeddiarra25@gmail.com>
Date:   Thu, 24 Mar 2022 12:50:50 +0300
Message-ID: <CAMpRB35aAfN=cNVd=49GnBrny3yvYTLX53iaopHyfYwJbfFfRg@mail.gmail.com>
Subject: Hello Friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4989]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ahmeddiarra25[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ahmeddiarra25[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Greetings,
I'm  Ozkan Sahin, and I work as a Financial Management Consultant. I'm
thrilled to approach you and present you with a lucrative offer I've
prepared. If you're interested in learning more, Please reply as soon
as possible.

Please contact me at (ozkansahin.gbbva@gmail.com).
Respectfully,
Ozkan Sahin
Financial Management Consultant
