Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733D252C736
	for <lists+linux-tegra@lfdr.de>; Thu, 19 May 2022 01:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbiERW6W (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 May 2022 18:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbiERW5X (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 May 2022 18:57:23 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22E690CE1
        for <linux-tegra@vger.kernel.org>; Wed, 18 May 2022 15:57:07 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id s12-20020a0568301e0c00b00605f30530c2so2389977otr.9
        for <linux-tegra@vger.kernel.org>; Wed, 18 May 2022 15:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=ovbcf3BPb/ZrA/FpQ+ZjErGDIEZ9sF3fYOxqsE4Z0xdiTlYY9UY36hS3ty6MLllddq
         FdZzNc2PcFHW5cwKZ0FlQqx6F8uTY06Ab/cmT+eL89dkm6I4fHT5v6DDGzwY+fqIjM8b
         RjeYQt93Ckr4p0lPVWY342OwWKznH6xDl4nV36uj7bwrBPcHFh3ePzF5GNEmu/mQBhIV
         GwWDekgJIDWSV60014hyLdzt2NtjUStY8MI6SiwBWMH8LEBnRGkE0W6Db0zUE9IYWmDQ
         Ifd6nbhkESdcIbQrjo3sdEfmdPtb1VAIHCw/LAZv1DOtvQwqLYnhML4dVDmuoYeMmVFn
         q7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=2kMmVMeajGvM/oV2q5nsiXW3ABQWzK4HAIjv0bd5hixvwf73Ozw4ofUXzGJWxQGvnt
         DA9a3+wxKGgL+N5FqVU9VtKuqhZeWWgCM/MMBj0XsfQXep4B/K7ZVB9V55fF2MSuSKvI
         rzH5pszzTfunq/GJU2MduxZ7CYYeks1OWMoGiICCCZsyqw8eNTNzWAfIojeZuQxFdkH2
         n4ULByVhRuWtzyZLahRdOE9WcOt87rKSdKwP7K9yYUztA4z4pKabf0GZQacH3fHwadT/
         OLc2Vf7x7SVbKpnbTF3mWHrcWRL1/2k79WpihNVkU3VSyPqnpmybKQAUpO2gLjtC/9E2
         KJqg==
X-Gm-Message-State: AOAM533stk0c5LW6sVJpiamcF6isz30GK/sRB7tWeiEzbwLjDRDIzeqK
        fhhxKsUS5AtuAixRBLcVzGchjm9y3Fmk/bxeL1ibXUMa04EWPCegOOtZpvZY
X-Google-Smtp-Source: ABdhPJyyLDAg+sVdsLTxwEXiZ5avjedwK/uWMP/Y3UWcChEjwDE+iXuY4kOycHY8vIqM/rcV0hLTcVdg0IN0RAQYgBc=
X-Received: by 2002:a5b:f87:0:b0:64a:9aa6:e181 with SMTP id
 q7-20020a5b0f87000000b0064a9aa6e181mr1852277ybh.157.1652914614913; Wed, 18
 May 2022 15:56:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:7143:0:0:0:0 with HTTP; Wed, 18 May 2022 15:56:53
 -0700 (PDT)
Reply-To: tonywenn@asia.com
From:   Tony Wen <weboutloock4@gmail.com>
Date:   Thu, 19 May 2022 06:56:53 +0800
Message-ID: <CAE2_YrD=5bo8j9+ah-xptEBBV-HEC4=Gb0SRHf996phiopc3WQ@mail.gmail.com>
Subject: engage
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Can I engage your services?
