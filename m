Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C13669B892
	for <lists+linux-tegra@lfdr.de>; Sat, 18 Feb 2023 08:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjBRHyJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 18 Feb 2023 02:54:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjBRHyJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 18 Feb 2023 02:54:09 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478534DBDE
        for <linux-tegra@vger.kernel.org>; Fri, 17 Feb 2023 23:54:08 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id t1so489841qkt.3
        for <linux-tegra@vger.kernel.org>; Fri, 17 Feb 2023 23:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEkw1KmmzfmMdZjy2G/k2kJ9Rp06l3CUoffIihDDUro=;
        b=QW2G5gZoD6EKX4KYP0dj/KZyNtXrkkOY3oaZ61TFN7aCx8EQBAPzgdi3kNKHSBsHYy
         +zN1cZAIVrxRDwDSrX9Loz4M/eQQhvmAoShp4a3iZJ1nHGKBVYUu95sy9YypWI1/59hw
         3fQkxpp+BprjQi9LZECkCbTJq4rAQVMHg4zhAsQG2n0/CvHFuu1f1Fnt+/vqrsOKM/a2
         ulDGZq2BaZn05g8FzX4XlXUPAl1p5IxWodfp2OdjoWIW21GVEUESXZliJXTZEYAojpGg
         +Q0PiV/qNpm64vcEYj6UHl5975vGVm5Un7m+3wwBquUq7dyjjURUjdbJazgovkM3eVeE
         ENLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEkw1KmmzfmMdZjy2G/k2kJ9Rp06l3CUoffIihDDUro=;
        b=1vkZ6ZOOnaG17LmhhlyloEAz7sowduMCKOtF0Wo3i6SUEJD0G77EwFHthk9K3P3nOV
         uRc1BXr6s52BhODkjuR5M1hFG/fGHg7Wkh1wmMDq6AVHJEafUbKP7xOIpWZjzUcSxdCq
         2Bqfai4QTi+PFK2+z8MprPB0v1F4DO31Gdv9aLOgEHolJjc3AGx45FhHTHfWQ5TWG79/
         Z8nmlfJ/6pXp0x91cdhDCguoGfBOyNRXsvSMaYjYTVen2BpGIxQoJh6QA+1+CeXIsYNl
         dNmodP7z/6B3k/IF3+ZXioyQ/f6yU9LKpw8V3jZudgruu8lRCG7UcdhaqbhyXPEmP57J
         GXxQ==
X-Gm-Message-State: AO0yUKXUfgSVQL3aK4TgLkNigg2EV81JVxqou1vJVBlMCncRqPQeWB4X
        E3BbWgw4N9KAQFoDk/WsECYpgKXQcuweL3vLve8=
X-Google-Smtp-Source: AK7set9YV0RBt1cX6AFjkBfBvsWaxI/ICJBFaRQjwWZpTU6+hI84IS79yQGg9uW8LcpBEYyvEYLKtlMPEbj/H4414iQ=
X-Received: by 2002:a37:78f:0:b0:73b:99da:bfa5 with SMTP id
 137-20020a37078f000000b0073b99dabfa5mr790257qkh.6.1676706847211; Fri, 17 Feb
 2023 23:54:07 -0800 (PST)
MIME-Version: 1.0
Sender: jubrilubaro@gmail.com
Received: by 2002:a0c:e40e:0:b0:569:271e:52b2 with HTTP; Fri, 17 Feb 2023
 23:54:06 -0800 (PST)
From:   AVA SMITH <avasmith1181@gmail.com>
Date:   Sat, 18 Feb 2023 07:54:06 +0000
X-Google-Sender-Auth: pki3Hy03h8U8dwnuW6IDwJ-Ta4A
Message-ID: <CAN1bjNpb9dE=XmE4Gi_gUcZszDYiqJABbt6N+0HQQugPXVnP-A@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,
My name is Dr Ava Smith,a medical doctor from United States.I have
Dual citizenship which is English and French.I will share more details
about me as soon as i get a response from you.

Thanks
Ava
