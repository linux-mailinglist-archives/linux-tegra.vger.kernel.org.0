Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2563B6DFC8A
	for <lists+linux-tegra@lfdr.de>; Wed, 12 Apr 2023 19:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbjDLRRW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 12 Apr 2023 13:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbjDLRRT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 12 Apr 2023 13:17:19 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D7A9EC3
        for <linux-tegra@vger.kernel.org>; Wed, 12 Apr 2023 10:16:55 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id z9so3659631ejx.11
        for <linux-tegra@vger.kernel.org>; Wed, 12 Apr 2023 10:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681319812; x=1683911812;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wE/45Tjy+3aF1MAgBhxKVXpZknBnmn0m95FCI5k7Dow=;
        b=cgwYcKxgKkrQo2Wr+MBsNyAG+QuNM2oMJaUcVi3OBGvV7kyYE8FO2+9dp1wNM5Zn+p
         qIp3vGhQl2Wz6Bpxx8hRkiF29WeK5iE20XAxERJgewJS819n/qHCbg6O27hXeMjJHNIJ
         p4d856Bg9iFQwHGvIy3zfrjpHWV1yEu3Cgi9MoIjRbEthN3jrTYUVV2WINgqIpw1ad5Z
         TJ2MC2sdV77DV7goO6WRUdOjg37Q0j2r3vtw02QAKg8cjL47yBLI7bgPt+jee8CoGG8r
         EsquWWyt6nEfVACluJsg2gNPw+pC9E1EmYkGxd/SIhTidoYoeeLmqlQPL6gVlMFKSFcB
         xR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681319812; x=1683911812;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wE/45Tjy+3aF1MAgBhxKVXpZknBnmn0m95FCI5k7Dow=;
        b=lIoB0F4uW9bfYNR9HgVJAasfP6Rij9f8pdIqg7CODvR78IuGG9eV78wuvjrnJQMxVp
         YDgxd39BD0wjQHn8C6tSsyzE9HCrO8kMvWpqRAXAd5/15IipX2tC+87RNYaZl677ayTD
         9Cc3x9SQH/p5KjqH9StILiRgr+Q2be+Mq7/Jnak3Yvz/LJnF+Fn4me/etBdCOVZ7NmFx
         qqnU+cVMlZNhruxXORRA/ZhHzzOhq0XIwb2xOkZuNMiXVOneKNkkIVXpoEtveDWxKAZn
         q3OWITFw99wGLRatfnGZhXVIJxronfz3/5zCzj1wjqOxlQ8ugtxq1DAu6epRAB/cbWK9
         ZPmA==
X-Gm-Message-State: AAQBX9dMh/cm7tX3iKT8HJuRIDHT1xBlp1WvQdFwJkpY0LeDfH3NSqkN
        VGZ5jMdjCmXfJnAp11l66eM2fS77iFuU9ppfKvI=
X-Google-Smtp-Source: AKy350Zyjv7qBq+oo032y1zCCdornwr8nPp34zUEwL06j2WMrc3DQqm/wwf8fFTHDjv+Yw0bpJZ9wWf/jiCPKVSEQF8=
X-Received: by 2002:a17:907:e88:b0:8d1:9162:514a with SMTP id
 ho8-20020a1709070e8800b008d19162514amr1690360ejc.8.1681319811454; Wed, 12 Apr
 2023 10:16:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:224f:b0:66:6ef5:9dab with HTTP; Wed, 12 Apr 2023
 10:16:51 -0700 (PDT)
From:   audu bello <ap2105ur@gmail.com>
Date:   Wed, 12 Apr 2023 19:16:51 +0200
Message-ID: <CABXi8UBNFatioTnxrCF6ASVhpATH0BqkYQ4zV7aPF5xz7evrZQ@mail.gmail.com>
Subject: your urgent attention is required
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

-- 
Hello

I have an urgent matter to discourse with you that will change our lives.

Please direct all future correspondence to me at au12bello@yahoo.com

Thanks,
Audit Manager
